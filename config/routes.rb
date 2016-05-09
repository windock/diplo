Rails.application.routes.draw do
  resources :categories
  resources :profiles, except: [:show]
  resources :devices, except: [:show]
  resources :products, except: [:show] do
    get 'new2', on: :collection
  end
  resources :primary_concerns, except: [:show]

  root to: 'profiles#index'
end
