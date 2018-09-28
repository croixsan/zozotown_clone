Rails.application.routes.draw do
  root 'tests#index'
  get 'tests/new' => 'tests#new'
  get 'carts/index' => 'carts#index'
end
