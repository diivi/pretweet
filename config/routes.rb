Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "about" => "about#index"

  get "sign-up" => "users#new"
  post "sign-up" => "users#create"

  get "sign-in" => "sessions#new"
  post "sign-in" => "sessions#create"

  delete "logout" => "sessions#destroy"
  # Defines the root path route ("/")
  root "main#index"
end
