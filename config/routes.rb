Rails.application.routes.draw do
  root to: 'home#index'

  resources :sessions, only: [:new, :create]

  get '/signup' => 'users#new'

  resources :users
  resources :tweets, only: [:index]
end
