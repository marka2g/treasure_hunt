Rails.application.routes.draw do
  # post "/games/:id", to: "games#move"
  post "/games/:id", to: "games#move", as: :move
  # get 'games/move'
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check
  root "games#start", as: :game_start
end
