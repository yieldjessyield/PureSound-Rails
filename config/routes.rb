Rails.application.routes.draw do
  resources :users
  resources :artists
  # post '/users/spotify', to: 'users#spotify'

  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
