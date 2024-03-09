Rails.application.routes.draw do
  post "/games/:id", to: "games#move"
  # get "/blog_posts/:id", to: "blog_posts#show", as: :blog_post
  get 'games/move'
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check
  root "games#start"
end
