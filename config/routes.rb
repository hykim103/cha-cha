Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'dance_classes#home'
  resources :studios, only: :show
  resources :genres, only: :show
  resources :dance_classes
end
