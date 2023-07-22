Rails.application.routes.draw do


  #管理者
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
  }
  devise_scope :admin do
    get '/admins/sign_out' => 'devise/sessions#destroy'
  end

  #ユーザー
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


  #デフォルト
  root to: 'homes#index'
  resources :inquiries, only:[:new, :create, :thank_you] do
    collection do
      get 'thank_you' => 'inquiries#thank_you'
    end
  end
  resources :blogs, only:[:index, :show]
  resources :customers, only:[:show]
  resources :genres, only: [:show ]

  #ユーザー
  namespace :user do
    resources :blogs, only: [:index, :show, :edit, :update, :destroy, :new, :create,:thank_you, :thank_you_edit] do
      collection do
        get 'thank_you' => 'blogs#thank_you'
        get 'thank_you_edit' => 'blogs#thank_you_edit'
      end
    end
    resources :customers, only:[:edit, :show] do
      member do
        get 'mypage' => 'customers#mypage'
      end
    end
  end

  #管理者
  namespace :admin do
    resources :blogs, only:[:destroy]
    resources :inquiries, only:[:index, :destroy]
    resources :genres, only:[:index, :create, :destroy, :update, :edit]
  end

end
