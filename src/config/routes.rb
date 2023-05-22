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
  post '/answer', to: 'questions#answer', as: :post_answer
  get 'easy_gam', to: 'questions#easy_gam'
  get 'normal_gam', to: 'questions#normal_gam'
  get 'hard_gam', to: 'questions#hard_gam'

end
