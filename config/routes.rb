Rails.application.routes.draw do
  get 'search/search'
  root to: 'homes#top'
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  devise_for :members

  namespace :admin do
    resources :categories, only:[:index, :create, :edit, :update]
  end

  namespace :member do
    resources :members
    resources :posts, only: [:new, :create, :index, :show, :update, :destroy, :edit] do
      resources :post_comments, only: [:create, :destroy] do
        resource :post_comment_favorites, only: [:create, :destroy]
      end
      resource :post_favorites, only: [:create, :destroy]
    end
  end

  get '/search', to: 'search#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
