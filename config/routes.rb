Rails.application.routes.draw do
  resources :games do
    resources :moves
  end
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check
  root "games#play", as: :play_game
end
