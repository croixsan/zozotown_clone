Rails.application.routes.draw do
  devise_for :users
  root 'tests#index'
  resources :users
  get 'tests/new' => 'tests#new'
  get 'carts/index' => 'carts#index' do
    get 'order/index' => 'orders#index'
  end
end
