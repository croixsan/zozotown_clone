Rails.application.routes.draw do
  root 'tests#index'
  get 'tests/new' => 'tests#new'
end
