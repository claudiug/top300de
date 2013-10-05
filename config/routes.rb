Top300de::Application.routes.draw do

  root "searches#new"

  resources :trips
  resources :default
  resources :searches


end
