Mlo::Engine.routes.draw do

  root to: "searches#index"
  resources :searches
  resources :users
end
