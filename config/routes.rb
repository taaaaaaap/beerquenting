Rails.application.routes.draw do
  devise_for :users
  get '/auth/:provider/callback', to: 'users#create', as: :auth_callback
  get '/auth/failure', to: 'users#auth_failure', as: :auth_failure
  root "beerquenting#index"
  resources :beerquenting do
    resources :comments, only:[:create]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show]
end