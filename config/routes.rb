Rails.application.routes.draw do
  root "tops#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  get 'users/index'
  get 'users/edit'
  patch 'users/update'
  patch 'users/update_card'
  patch 'users/update_mail'

  get 'carts/index' => 'carts#index'
  post 'carts/create' => 'carts#create'
  delete 'carts/destroy' => 'carts#destroy'


  get 'carts/register' => 'carts#register'

  get 'searches/index' => 'searches#index'

  # -- クーポン機能 --------------------
  resources :coupons, only: [:index, :new, :create]


  resources :carts, only: [:index, :create, :destroy, :show]
  resources :orders, only: [:index, :new, :create, :show]
  resources :pre_orders, only: [:new, :create]
  # -- ランキング機能 --------------------
  resources :rankings, only: :index

  # -- ショッピング機能 --------------------
  resources :carts, only: [:index, :create, :destroy, :show] do
    collection do
      get :register
    end
  end
  resources :orders, only: [:index, :new, :create, :show]
  resources :pre_orders, only: [:new, :create]
  resources :scrapings, only: [:index] do
    collection do
      get :category
      get :brand
      get :shop
      get :delivery
      get :payment
    end
  end

  # -- お気に入り機能 --------------------
  resources :favorites, only: [:index] do
    collection do
      post :brand_create
      post :shop_create
    end
    member do
      delete :brand_destroy
      delete :shop_destroy
    end
  end

  # -- カテゴリー --------------------
  resources :top_categories, only: [:index, :show] do
    resources :sub_categories, only: [:index, :show]
  end

  concern :categories do
    resources :top_categories, only: [:index, :show] do
      resources :sub_categories, only: [:index, :show]
    end
  end

  # -- Base ------------------------
  resources :tops, only: [:index]
  resources :brands, only: [:index, :show], concerns: :categories
  resources :shops, only: [:index, :show], concerns: :categories do
    resources :items, only: [:index, :show] do
      resources :favorites, only: [:create, :destroy]
    end
  end

  scope :mens do
    resources :tops, only: [:index]
    resources :brands, only: [:index, :show], concerns: :categories
    resources :shops, only: [:index, :show], concerns: :categories do
      resources :items, only: [:index, :show]
    end
    resources :top_categories, only: [:index, :show] do
      resources :sub_categories, only: [:index, :show]
    end
  end

  scope :ladies do
    resources :tops, only: [:index]
    resources :brands, only: [:index, :show], concerns: :categories
    resources :shops, only: [:index, :show], concerns: :categories do
      resources :items, only: [:index, :show]
    end
    resources :top_categories, only: [:index, :show] do
      resources :sub_categories, only: [:index, :show]
    end
  end

  scope :kids do
    resources :tops, only: [:index]
    resources :brands, only: [:index, :show], concerns: :categories
    resources :shops, only: [:index, :show], concerns: :categories do
      resources :items, only: [:index, :show]
    end
    resources :top_categories, only: [:index, :show] do
      resources :sub_categories, only: [:index, :show]
    end
  end
end
