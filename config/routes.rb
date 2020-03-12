Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'articles#index'
  resources :articles do
    resources :likes, only: [:create]
    resources :comments, only: [:create]
  end
  resources :users, only: [:show] do
    resources :profiles, only: [:edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
