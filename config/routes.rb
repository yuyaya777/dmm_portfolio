Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  devise_for :members

  namespace :admin do
    resources :members
    resources :categories, only:[:index, :create, :edit, :update]
    resources :post_comments
    resources :posts
  end

  namespace :member do
    resources :members
    resources :posts, only: [:new, :create, :index, :show, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
    end
    resources :post_favorites
    resources :post_comment_favorites
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
