Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :pokemons, only: [ :index, :show, :update, :create, :destroy ]
    end
  end

  root to: "pages#home"

  resources :pokemons, only: [ :index ]

end
