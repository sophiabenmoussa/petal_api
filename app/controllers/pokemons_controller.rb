class PokemonsController < ApplicationController
  POKEMONS_PER_PAGE = 12

  def index
    @page = params.fetch(:page,0).to_i
    @pokemons = Pokemon.offset(@page * POKEMONS_PER_PAGE).limit(POKEMONS_PER_PAGE)
  end

end
