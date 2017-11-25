Rails.application.routes.draw do
  devise_for :users

  resources :test_sets, except: [:index] do
    member do
      get 'flashcards_test'
      get 'true_falses_test'
      get 'multiple_choices_test'
    end
    resources :flashcards, except: [:index]
    resources :true_falses, except: [:index]
    resources :multiple_choices, except: [:index]

  end

  resources :notes
  get 'search' => 'search#search'
  # get 'search', to: 'search#search'

  get 'account' => 'user#index'

  get 'welcome/index'

  root 'welcome#index'
end
