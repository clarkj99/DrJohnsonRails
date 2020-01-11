Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "auth", to: "auth#create"
      get "profile", to: "users#profile"
      post "users", to: "users#create"
      get "encounters", to: "encounters#index"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
