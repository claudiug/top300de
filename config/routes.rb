Top300de::Application.routes.draw do

  resources :users
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  root "searches#new"

  resources :trips
  resources :default
  resources :searches


end
