Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # We define root to the homepage
  root to:'static_pages#index'

  # Routes for Devise
  devise_for :users

  # ------- Route declarations : ---------
  resources :ads


end
