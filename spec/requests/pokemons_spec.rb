require 'rails_helper'

RSpec.describe "Pokemons", type: :request do
  describe "GET /index" do
   let(:my_user) { User.create(email: 'test@petal.com', password: '123456') }
    let!(:my_poke1) { Pokemon.create(
      name: 'Poke1',
      total: 300,
      user_id: my_user.id) }

    let!(:my_poke2) { Pokemon.create(
      name: 'Poke2',
      total: 300,
      user_id: my_user.id) }

    it "assigns @pokemons" do
      pokemon = Pokemon.create
      get '/pokemons'
      expect(assigns(:pokemons).size).to eq(2)
    end

    it "renders the index template" do
      get '/pokemons'
      expect(response).to render_template("index")
    end
  end
end
