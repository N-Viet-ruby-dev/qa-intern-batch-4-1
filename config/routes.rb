Rails.application.routes.draw do
  root to: "static_pages#home"
  get "/home", to: "static_pages#home"
  get  "/register",  to: "users#new"
  post "/register",  to: "users#create"
end
