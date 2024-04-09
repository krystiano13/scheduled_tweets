Rails.application.routes.draw do
  root to: "main#index"

  get "up" => "rails/health#show", as: :rails_health_check
  get "/about", to: "about#index"
  get "/register", to: "register#index"
  get "/login", to: "session#index"
  get "/password", to: "password#index"
  get "/password/reset", to: "password_reset#index", as: :password_reset

  patch "/password", to: "password#update"

  post "/register", to: "register#create"
  post "/login", to: "session#create"
  post "/password/reset", to: "password_reset#create"

  delete "/logout", to: "session#delete"
end
