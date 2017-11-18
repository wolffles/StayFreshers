Rails.application.routes.draw do
  devise_for :users

  resources :test_sets, except: [:index] do
    resources :flashcards, except: [:index]
    resources :true_falses, except: [:index]
    resources :multiple_choices, except: [:index]
  end

  resources :notes, except: :index
  
  get 'account' => 'user#index'

  get 'welcome/index'

  root 'welcome#index'
end
