Rails.application.routes.draw do
  get 'homes/top'
  get 'homes/about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit]
  resources :posts, only: [:new, :index, :show, :create] do
    resources :comments, only: [:new, :index, :show, :create]
  end
  resources :likes, only: [:index, :create, :destroy]
  root 'homes#top'
end
