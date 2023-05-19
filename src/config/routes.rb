Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to:"tops#index"
  resources :questions, only: [:index, :show, :new, :create, :edit, :update]

  
end
