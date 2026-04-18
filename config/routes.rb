Rails.application.routes.draw do
  root "pages#home"
  get "about", to: "pages#about"
  get "posts", to: "pages#posts"
  get "posts/hello_world", to: "pages#hello_world"
  get "posts/rails_app", to: "pages#rails_app"
  get "up" => "rails/health#show", as: :rails_health_check
end
