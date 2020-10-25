Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/top'
  get 'homes/about'
  get 'users/cancel'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :posts do
    collection do
    get 'search'
    end
    resources :likes, only: [:create, :destroy]
  end
  get 'likes/index'

  resources :comments, only: [:new, :index, :show, :create]
end
