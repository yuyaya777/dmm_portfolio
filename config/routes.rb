Rails.application.routes.draw do
  
  namespace :member do
    get 'inquiry/index'
    get 'inquiry/conform'
    get 'inquiry/thanks'
  end
  
  # 検索機能
  get 'search/search'

  root to: 'homes#top'

  # デバイス（管理者側）
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  # デバイス（ユーザー側）
  devise_for :members

  # 管理者側
  namespace :admin do
    resources :categories, only:[:index, :create, :new, :edit, :update]
  end

  # ユーザー側
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
