Rails.application.routes.draw do

  get '/profile', to: 'users#profile'

  get 'comments/create'

  devise_for :users
  resources :projects do
    resources :comments, only: :create
  end

  root 'projects#index'

end