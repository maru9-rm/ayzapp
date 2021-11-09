Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'reports#index'
  resources :reports do
    resources :comments, only: [:new, :create]
    resource :point, only: [:create, :destroy]
  end

  resources :accounts, only: [:show]

  resource :profile, only: [:show, :edit, :update] do
    resources :tasks, only: [:new, :create, :destroy]
  end
  
end
