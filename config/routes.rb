Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # We define root to the homepage
  root to:'static_pages#index'

  # Routes for Devise
  devise_for :users

  # ------- Route declarations : ---------
  resources :ads
  resources :admins, only: [:index, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :update, :destroy]

  # Admin dashboard
  namespace :admins do
    root to: "admins#index"
    resources :users
    resources :ads, only: [:index, :edit, :update, :destroy]
  end
end
