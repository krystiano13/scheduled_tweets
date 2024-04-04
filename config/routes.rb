Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  get "/about", to: "about#index"
  root to: "main#index"
  get "/register", to: "register#index"

  post "/register", to: "register#create"
end
