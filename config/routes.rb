Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movies, only: [:index, :show]
  resources :users, only: [:show, :new, :create]
  resources :orders, only: [:new, :create, :show]
end
