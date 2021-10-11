Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "welcome/index"  
  root to: "welcome#index"  
  namespace :apis do
    get "/quotes", to: "quotes#index"
    put "/quotes/rating", to: "quotes#update_rating"
  end
end
