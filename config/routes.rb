Rails.application.routes.draw do
  devise_for :users

  resources :test_sets

  get 'account' => 'user#index'
  get 'welcome/index'

  root 'welcome#index'
end
