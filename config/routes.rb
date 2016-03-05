Rails.application.routes.draw do
  resources :devices, except: [:show]
  resources :products, except: [:show]
  resources :users

  root to: 'visitors#index'
  devise_for :users
end
