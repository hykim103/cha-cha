Rails.application.routes.draw do
  get 'dance_classes/index'
  get 'dance_classes/show'
  get 'dance_classes/new'
  get 'dance_classes/create'
  get 'dance_classes/edit'
  get 'dance_classes/update'
  get 'dance_classes/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :dance_classes
end
