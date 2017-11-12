Rails.application.routes.draw do
  devise_for :users

  get 'account' => 'user#index'
  get 'welcome/index'

  root 'welcome#index'
end
