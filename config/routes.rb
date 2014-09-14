Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users

  resources :posts do
    resource :like, only: :create
  end
  resources :users
  resource :friendship do
    patch :accept
  end
  resources :notifications
end
