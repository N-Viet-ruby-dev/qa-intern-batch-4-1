Rails.application.routes.draw do
  root to: "static_pages#home"
  get "/home", to: "static_pages#home"
  get  "/register",  to: "users#new"
  post "/register",  to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  mount Ckeditor::Engine => "/ckeditor"
  get "/autocomplete", to: "searches#show"

  resources :users, except: [:new, :create, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :questions, except: [:new, :edit] do
    resources :answers, except: [:index, :show, :new]
  end
  resources :searches, only: :index
end
