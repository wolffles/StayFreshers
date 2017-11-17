Rails.application.routes.draw do
  devise_for :users

  resources :test_sets, except: [:index] do
    resources :flashcards, except: [:index]
    resources :true_falses, except: [:index]
  end
  get 'account' => 'user#index'

  get 'welcome/index'

  root 'welcome#index'
end
