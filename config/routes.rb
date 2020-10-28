Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/top'
  get 'homes/about'
  get 'users/cancel'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update, :destroy] do
    collection do
    get 'like'
    end
  end

  resources :posts do
    collection do
    get 'search'
    end
    resources :comments, only: [:new, :show, :create, :destroy]
  end
  
  get 'likes/index'

  post   '/like/:post_id' => 'likes#like',   as: 'like'
  delete '/like/:post_id' => 'likes#unlike', as: 'unlike'

end
