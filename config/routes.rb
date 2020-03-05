Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources :articles do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
