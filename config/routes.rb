Rails.application.routes.draw do
  get "/static_pages/*page", to: "static_pages#show"

  get "signup", to: "users#new"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :users, except: :new
  resources :orders, only: [:new, :create, :show]
  resources :products, only: :show
  resources :carts, only: :show
  resources :line_items, only: [:create, :update, :destroy]

  root "static_pages#show", page: "home"
end
