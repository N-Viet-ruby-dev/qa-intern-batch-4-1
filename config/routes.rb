Rails.application.routes.draw do
  root to: "static_pages#home"
  get "/home", to: "static_pages#home"
  get  "/register",  to: "users#new"
  post "/register",  to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, except: [:new, :create, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :questions
end
