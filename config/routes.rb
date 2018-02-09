Rails.application.routes.draw do
#static_pages
  root 'static_pages#home'
  get 'static_pages/home'
#Events

#Sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
#Users
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users
end
