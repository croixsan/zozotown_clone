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

  get 'carts/register' => 'carts#register'

  post 'carts/create' => 'carts#create'

  delete 'carts/destroy' => 'carts#destroy'

  resources :rankings, only: :index

  get 'searches/index' => 'searches#index'

  get "men_top"    => "tops#men"
  get "women_top"  => "tops#women"
  get "kid_top"    => "tops#kid"
  get "tests/search" => "tests#search"

  get "tests/information" => "tests#information"
  get "tests/info_addless" => "tests#info_addless"
  get "tests/info_mail" => "tests#info_mail"
  get "tests/info_pass" => "tests#info_pass"
  post "tests/registration" => "tests#registration"


  resources :carts, only: [:index, :create, :destroy, :show] do
  end
  resources :orders, only: [:index, :new, :create, :show] 
  resources :pre_orders, only: [:new, :create]

  concern :categories do
    resources :top_categories, only: [:index, :show] do
      resources :sub_categories, only: [:index, :show]
    end
  end

  resources :tops, only: [:index]
  resources :brands, only: [:index, :show], concerns: :categories
  resources :shops, only: [:index, :show], concerns: :categories do
    resources :items, only: [:index, :show] do
      resources :favorites, only: [:create, :destroy]
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

  resources :top_categories, only: [:index, :show] do
    resources :sub_categories, only: [:index, :show]
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
