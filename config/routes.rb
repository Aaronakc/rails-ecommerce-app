Rails.application.routes.draw do
  get "orders/index"
  get "orders/create"
  get "orders/show"
  get "orders/destroy"
  root "products#index"
  resources :products ,only: [:index,:show]
  devise_for :users
  resources :cart_items, only: [:create,:destroy]
  resources :carts, only: [:show]
  resources :orders, only: [:index,:show,:destroy,:create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
