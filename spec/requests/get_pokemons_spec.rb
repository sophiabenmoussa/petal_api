require 'rails_helper'

RSpec.describe 'Pokemons', type: :request do
  describe 'GET /index' do
    let(:my_user) { User.create(email: 'test@petal.com', password: '123456') }
    let!(:my_poke1) { Pokemon.create(
      name: 'Poke1',
      total: 300,
      user_id: my_user.id) }

    let!(:my_poke2) { Pokemon.create(
      name: 'Poke2',
      total: 300,
      user_id: my_user.id) }

    before do

      get '/api/v1/pokemons'
    end

    it 'returns all posts' do
      expect(json.size).to eq(2)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
