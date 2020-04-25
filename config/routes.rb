Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root to: "tops#index"
  resources :tops, only: [:index]
  resources :categories, only: [:index, :new, :create, :edit, :update]
  resources :articles do
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
    resources :comments, only: [:create]
  end
  resources :users, only: [:show] do
    resources :profiles, only: [:edit, :update]
  end
end
