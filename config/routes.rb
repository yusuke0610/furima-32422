Rails.application.routes.draw do
  
  devise_for :users

  root to: "items#index"

  resources :items

  
  resources :articles
  resources :article_delivery_fees
  resources :article_days_ships
  resources :article_categories
  resources :article_conditions
end







   