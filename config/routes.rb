Rails.application.routes.draw do

  resources :users, only: :update
  get '/profile', to: 'users#profile'

  get 'comments/create'

  devise_for :users
  resources :projects do
    get :search, on: :collection
    resources :comments, only: :create
  end

  root 'projects#index'

end