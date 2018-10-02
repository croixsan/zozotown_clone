Rails.application.routes.draw do
  root "tops#all"
  devise_for :users
  resources :users
  get 'carts/index' => 'carts#index'
    get 'order/index' => 'orders#index' #←ネストする

  get "men_top"    => "tops#men"
  get "women_top"  => "tops#women"
  get "kid_top"    => "tops#kid"
  get "tests/search" => "tests#search"

  resources :men_shops, only: [:index, :show]
  resources :women_shops, only: [:index, :show]
  resources :kid_shops, only: [:index, :show]
  resources :shops, only: [:index, :show] do
    resources :items, only: [:index, :show]
  end
end
