Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  get "weather/:city", to: "weather#show"
end
