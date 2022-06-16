Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :scientists
  resources :planets, only: %i[index]
  resources :missions, only: %i[create]
end
