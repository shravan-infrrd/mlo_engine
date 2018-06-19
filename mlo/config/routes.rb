Mlo::Engine.routes.draw do

  root to: "searches#index"
  resources :searches
  get 'users/show_mlo_results' => "users#show_mlo_results"
  resources :users, only: [:index]

end
