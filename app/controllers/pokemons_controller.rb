class PokemonsController < ApplicationController
  BOOKS_PER_PAGE = 12

  def index
    @page = params.fetch(:page,0).to_i
    @pokemons = Pokemon.offset(@page * BOOKS_PER_PAGE).limit(BOOKS_PER_PAGE)
  end

end
