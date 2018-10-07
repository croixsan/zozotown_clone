Rails.application.routes.draw do
  root "tops#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  get 'carts/index' => 'carts#index'

  get 'carts/register' => 'carts#register'

  post 'carts/create' => 'carts#create'

  delete 'carts/destroy' => 'carts#destroy'

    get 'order/index' => 'orders#index' #←ネストする

  get 'rankings/index' => 'rankings#index'

  get "men_top"    => "tops#men"
  get "women_top"  => "tops#women"
  get "kid_top"    => "tops#kid"
  get "tests/search" => "tests#search"

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
