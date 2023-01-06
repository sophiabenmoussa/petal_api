require 'rails_helper'

RSpec.describe 'Pokemons', type: :request do
  describe 'POST /create' do
    context 'when user is authentify' do
      let(:my_user) { User.create(email: 'test@petal.com', password: '123456') }
      let(:my_pokemon) { Pokemon.create(
          name: 'Poke11',
          total: 300,
          user_id: my_user.id) }

      let(:user_token) { my_user.authentication_token }
      let(:headers) do {
          'X-User-Email' => my_user.email,
          'X-User-Token'=> user_token
         }
      end

      before do
          post '/api/v1/pokemons', headers: headers , params: params
      end

      context 'with valid parameters' do
        let(:params) do {
          pokemon: { name: my_pokemon.name, total: my_pokemon.total }
        }
        end

        it 'returns the name' do
          expect(json['name']).to eq(my_pokemon.name)
        end

        it 'returns the total' do
          expect(json['total']).to eq(my_pokemon.total)
        end

        it 'returns a created status' do
          expect(response).to have_http_status(:created)
        end
      end

      context 'with invalid parameters' do
        let(:params) do {
          pokemon: { name: '', total: my_pokemon.total }
        }
        end

        it 'returns a unprocessable entity status' do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context 'when user is not authentify' do
      before do
        post '/api/v1/pokemons', params:
                          { pokemon: {
                            name: 'Poke2',
                            total: 200,
                            user_id: 1
                          } }
      end

      it 'returns error when the user is not authentify' do
        expect(json['error']).to eq('You need to sign in or sign up before continuing.')
      end
    end
  end
end
