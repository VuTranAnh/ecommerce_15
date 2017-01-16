Rails.application.routes.draw do
  get "/static_pages/*page", to: "static_pages#show"

  get "signup", to: "users#new"

  resources :users, except: :new

  root "static_pages#show", page: "home"
end
