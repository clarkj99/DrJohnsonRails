Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "auth", to: "auth#create"
    end
  end
  namespace :api do
    namespace :v1 do
      get "profile", to: "users#profile"
      post "users", to: "users#create"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
