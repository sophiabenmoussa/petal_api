class Api::V1::PokemonsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_pokemon, only: [ :show, :update, :destroy ]

  def index
    @pokemons = policy_scope(Pokemon)
  end

  def show
  end

  def update
    if @pokemon.update(pokemon_params)
      render :show
    else
      render_error
    end
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.user = current_user
    authorize @pokemon
    if @pokemon.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @pokemon.destroy
    head :no_content
  end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
    authorize @pokemon
  end

  def pokemon_params
    params.require(:pokemon).permit(:file_id, :name, :type_1, :type_2, :total,
      :hp, :attack, :defense, :sp_atk, :sp_def, :speed, :generation, :legendary)
  end

  def render_error
    render json: { errors: @pokemon.errors.full_messages },
      status: :unprocessable_entity
  end
end
