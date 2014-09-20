Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users

  resources :posts, shallow: true do
    resource :like, only: [:create, :destroy]
    resources :comments, only: :create do
      resource :like, only: [:create, :destroy]
    end
  end
  resources :text_posts, only: [:create]

  resources :users
  resource :friendship do
    patch :accept
  end
  resources :notifications
end
