Rails.application.routes.draw do
  root to: 'home#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'

  resources :users
  get '/search', to: 'tweets#search'
  resources :tweets, only: [:index, :create]
end
