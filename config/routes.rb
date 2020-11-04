Rails.application.routes.draw do

  get 'posts/index'
  get 'posts/show'
  get 'posts/edit'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  devise_for :admins,controllers: {
  sessions: 'admins/sessions'
  }

  devise_for :users, controllers: {
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do

  end

    root 'homes#top'
    get 'homes/top'
    get 'homes/about'
    get 'users/cancel'

    resources :users, only: [:show, :edit, :update, :destroy] do
      collection do
      get 'like'
      get 'confirm'
      end
    end

    resources :posts do
      collection do
      get 'search'
      end
      resources :comments, only: [:new, :create, :destroy]
    end

    get 'likes/index'
    post   '/like/:post_id' => 'likes#like',   as: 'like'
    delete '/like/:post_id' => 'likes#unlike', as: 'unlike'

end
