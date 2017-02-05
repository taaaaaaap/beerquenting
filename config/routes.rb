Rails.application.routes.draw do
  devise_for :users
  root "beerquenting#index"
  resources :beerquenting do
    resources :comments, only:[:create]
  end
  resources :users, only: [:show]
end