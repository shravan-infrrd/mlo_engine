Mlo::Engine.routes.draw do

  root to: "searches#index"
  resources :searches
  resources :users, only: [:index]
#  get 'users/search' => "users#search"
end
