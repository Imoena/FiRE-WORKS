Rails.application.routes.draw do

  get 'posts/index'
  get 'posts/show'
  get 'posts/edit'
  get 'users/index'
  get 'users/show'
  get 'users/edit'

  devise_for :admins,controllers: {
  sessions: 'admins/sessions',
  passwords: 'admins/passwords',
  registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  root 'users/homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admins do
    get 'homes/top'
    get 'homes/about'
    get 'users/cancel'

    resources :users, only: [:index, :show, :edit, :update, :destroy] do
      collection do
      get 'like'
      get 'confirm'
      get 'search'
      end
    end

    resources :posts do
      collection do
      get 'search'
      end
      resources :comments, only: [:new, :create, :destroy]
    end

    resources :events


  end

  scope module: :users do
    resources :users, only: [:show, :edit, :update, :destroy] do
      collection do
      get 'like'
      get 'confirm'
      get 'cancel_confirmation'
      get 'edit_password'
      put 'edit_password'
      end
    end

    resources :posts do
      collection do
      get 'search'
      end
      resources :comments, only: [:new, :create, :destroy]
    end

    resources :events, only: [:index, :show]
    get 'likes/index'
    post   '/like/:post_id' => 'likes#like',   as: 'like'
    delete '/like/:post_id' => 'likes#unlike', as: 'unlike'

    get 'homes/top'
    get 'homes/about'

  end


end
