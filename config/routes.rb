Rails.application.routes.draw do
  resources :users
  resources :artists
  get '/liked_artists', to: 'artists#liked_artists'
  post '/save_liked_artist', to: 'artists#save_liked_artist'
  post '/update_user_info', to: 'users#update'
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
