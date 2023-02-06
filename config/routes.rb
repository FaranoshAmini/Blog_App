Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
  resources :posts, only: [:new, :create] do 
    resources :comments, only: [:new, :create]
  end
  resources :likes, only: [:create]
end