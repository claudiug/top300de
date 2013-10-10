Top300de::Application.routes.draw do

  get "users/index"
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  root "searches#new"
  resources :users

  resources :trips
  resources :default
  resources :searches




end
