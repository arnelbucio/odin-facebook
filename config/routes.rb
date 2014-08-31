Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users

  resources :posts
  resources :users
  resources :friendships do
    patch :accept, on: :member
  end
end
