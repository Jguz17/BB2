Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show]
  resources :orders
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: "sessions#create"

  delete "sessions", to: "sessions#destroy"

end
