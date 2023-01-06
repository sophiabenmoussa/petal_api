require 'rails_helper'

RSpec.describe 'Pokemons', type: :request do
  describe "DELETE /destroy" do
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
        delete "/api/v1/pokemons/#{my_pokemon.id}", headers: headers
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
