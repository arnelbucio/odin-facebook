Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks',
                                    registrations: 'registrations' }

  resources :posts, shallow: true, except: [:index] do
    resource :like, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy] do
      resource :like, only: [:create, :destroy]
    end
  end
  resources :text_posts, only: [:create]
  resources :photo_posts, only: [:create]

  resources :users, only: [:index, :show]
  resource :friendship, only: [:create, :destroy] do
    patch :accept
  end
  resources :notifications, only: [:index]
end
