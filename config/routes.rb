Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movies, only: [:index, :show]
  resources :users, only: [:show, :new, :create]
  resources :orders, only: [:new, :create, :show]
  resources :genres, only: [:show]

  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post "sessions", to: "sessions#create", as: "sessions"

  delete "sessions", to: "sessions#destroy"

end
