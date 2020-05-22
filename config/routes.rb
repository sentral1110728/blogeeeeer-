Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  root to: "tops#index"
  resources :tops, only: [:index]
  resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :articles do
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
    resources :comments, only: [:create]
  end
  resources :users, only: [:index, :edit, :update] do
    resources :profiles, only: [:edit, :update, :show]
  end
end
