Mlo::Engine.routes.draw do

  root to: "searches#index"
  resources :searches

  get 'users/show_mlo_results' => "users#show_mlo_results"
  get 'users/find' => "users#find"
  get '/users' => "users#index"
  get '/component_library', to: 'themes#styleguide'
  get '/theme.css', to: 'themes#index', as: 'theme_path'
  get '/styleguide', to: 'themes#styleguide'



end
