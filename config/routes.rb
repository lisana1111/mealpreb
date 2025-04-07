Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  root "home#index"
  resources :recipes do 
    resources :amounts, only: [:create, :destroy]
  end
  resources :ingredients
  resources :weeklyplaner, only: [:show, :edit, :update]
  get "up" => "rails/health#show", as: :rails_health_check
 end
