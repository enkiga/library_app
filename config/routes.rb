Rails.application.routes.draw do
  root "books#index"

  get "signup", to: "users#new"
  post "signup", to: "users#create"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :books do
    post "borrow", on: :member
  end

  resources :borrowings do
    post "return", on: :member
  end

  get "profile", to: "users#show", as: "profile"
end
