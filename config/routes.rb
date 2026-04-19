Rails.application.routes.draw do
  root "pages#home"
  get "about", to: "pages#about"
  get "posts", to: "posts#index"
  get "posts/:slug", to: "posts#show", as: :post
  get "up" => "rails/health#show", as: :rails_health_check
end
