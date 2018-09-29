Rails.application.routes.draw do
  devise_for :users
  root 'tests#favorite'
  resources :users
  get 'tests/new' => 'tests#new'
  get 'carts/index' => 'carts#index'
end
