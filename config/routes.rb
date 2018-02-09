Rails.application.routes.draw do
#static_pages
  root 'static_pages#home'
  get 'static_pages/home'
#Events
get 'events/:id/participe/', to: 'events#participe'
get 'events/:id/unfollow', to: 'events#unfollow'
get '/new-event', to: 'events#new'
post '/new-event', to: 'events#create'
get '/all-events', to: 'events#index'
resources :events
#Sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
#Users
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users
end
