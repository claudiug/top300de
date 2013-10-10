Top300de::Application.routes.draw do

  root "default#home"
  get "users/index"
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  resources :users
  resources :feedback

  namespace :admin do
    get "dashboard/index"
    resources :categories
    resources :hotels
    resources :restaurants
  end




end
