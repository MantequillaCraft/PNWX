Rails.application.routes.draw do
  resources :categories
  
  root "application#home"

  get "/lead_glass", to: "products#lead_glass"
  get "/mobile_lead_barriers", to: "products#mobile_lead_barriers"
   get "/lead_aprons", to: "products#lead_aprons"
  resources :products do
    post 'add_to_cart', on: :member
  end
  resources :categories, except: [:show]

  namespace :authentication, path: '', as: '' do
    resources :users, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
