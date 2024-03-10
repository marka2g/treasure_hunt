Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  devise_for :users
  
  resources :games

  ## patch "/games/:id/move", to: "games#move", as: :move
  # post "/games/:id/move", to: "games#move", as: :make_move
  # get "/games/:id/move", to: "games#move", as: :get_move
  # get 'games/:id/win/', to: "games#win", as: :win
  root "games#play", as: :game_play
end
