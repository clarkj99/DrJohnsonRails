Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "auth", to: "auth#create"
      get "profile", to: "profiles#show"
      patch "profile", to: "profiles#update"
      get "history/:id", to: "histories#show"
      patch "history/:id", to: "histories#update"
      get "users", to: "users#index"
      post "users", to: "users#create"
      get "demo", to: "users#demo"
      get "encounters", to: "encounters#index"
      post "encounters", to: "encounters#create"
      get "encounter/:id", to: "encounters#show"
      patch "encounter/:id", to: "encounters#update"
      get "hpi/:id", to: "hpis#show"
      patch "hpi/:id", to: "hpis#update"
      get "rosystem/:id", to: "rosystems#show"
      patch "rosystem/:id", to: "rosystems#update"
      get "problem_exam/:id", to: "problem_exams#show"
      patch "problem_exam/:id", to: "problem_exams#update"
      get "intake/:id", to: "intakes#show"
      patch "intake/:id", to: "intakes#update"
      get "diagnosis/:id", to: "diagnoses#show"
      patch "diagnosis/:id", to: "diagnoses#update"
      get "photo/:id", to: "photos#show"
      patch "photo/:id", to: "photos#update"
      get "icd10s", to: "icd10s#index"
      get "icd10/:id", to: "icd10s#show"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
