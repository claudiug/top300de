Top300de::Application.routes.draw do

  resources :users

  root "searches#new"

  resources :trips
  resources :default
  resources :searches


end
