Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "about" => "about#index"

  get "sign-up" => "users#new"
  post "sign-up" => "users#create"

  get "sign-in" => "sessions#new"
  post "sign-in" => "sessions#create"

  get "password" => "passwords#edit", :as => 'edit_password'
  patch "password" => "passwords#update"

  delete "logout" => "sessions#destroy"

  get "password/reset" => "password_resets#new"
  post "password/reset" => "password_resets#create"

  get "password/reset/edit" => "password_resets#edit"
  patch "password/reset/edit" => "password_resets#update"

  get "/auth/twitter/callback" => "omniauth_callbacks#twitter"

  resources :twitter_accounts 

  root "main#index"
end
