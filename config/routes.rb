Rails.application.routes.draw do
  root to: 'home#index'

  get '/signup' => 'users#new'

  # resources :sessions, only: [:new, :create]
  resources :users
  resources :tweets, only: [:index]
end
