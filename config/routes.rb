Rails.application.routes.draw do
  devise_for :users
  root to: 'statements#index'
  resources :rors,only: [:index,:create] do
     collection do
       get 'search'
     end
  end
  resources :uipaths,only: [:index,:create] do
    collection do
      get 'search'
    end
  end
  resources :statements,only: [:index]
  resources :users, only: [:edit, :update]
  resources :languages, only: [:new, :create]

end
