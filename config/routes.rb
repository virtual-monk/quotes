Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "welcome#index"  
  namespace :apis do
    # get "/quotes", to: "quotes#index"
    # put "/quotes/rating", to: "quotes#update_rating"
    resources :quotes do
      resources :ratings do
      end
    end
  end
end
