Rails.application.routes.draw do
  root to: 'home#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'

  resources :users
  resources :tweets, only: [:index]
end
