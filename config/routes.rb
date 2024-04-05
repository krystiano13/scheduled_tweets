Rails.application.routes.draw do
  root to: "main#index"

  get "up" => "rails/health#show", as: :rails_health_check
  get "/about", to: "about#index"
  get "/register", to: "register#index"

  post "/register", to: "register#create"

  delete "/logout", to: "session#delete"
end
