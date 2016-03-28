Rails.application.routes.draw do
  resources :categories
  resources :profiles, except: [:show]
  resources :devices, except: [:show]
  resources :products, except: [:show]
  resources :primary_concerns, except: [:show]

  root to: 'visitors#index'
  #devise_for :users
end
