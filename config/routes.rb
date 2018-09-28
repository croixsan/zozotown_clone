Rails.application.routes.draw do
  root 'tops#index'
  get 'tests/new' => 'tests#new'
  get 'carts/index' => 'carts#index'


  get "men_top"    => "tops#men"
  get "women_top"  => "tops#women"
  get "kid_top"    => "tops#kid"

  resources :men_shops, only: [:index, :show]
  resources :women_shops, only: [:index, :show]
  resources :kid_shops, only: [:index, :show]
  resources :shops, only: [:index, :show] do
    resources :items, only: [:index, :show]
  end
end
