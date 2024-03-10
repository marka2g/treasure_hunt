Rails.application.routes.draw do
  resources :moves
  resources :games
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check
  root "games#index"
end
