Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "tops#index"
  
  resources :jade_features, only: [:index]

  resources :questions, only: [:index]
  get 'answer/:answer', to: 'questions#answer', as: :answer
  get '/answer', to: 'questions#answer'
  get 'result', to: 'questions#result'
  get 'questions_path', to: 'questions#reset_score'
  get 'start', to: 'questions#start'
end
