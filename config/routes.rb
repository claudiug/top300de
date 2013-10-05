Top300de::Application.routes.draw do

  root "default#home"

  resources :trips
  resources :default
  resources :searches


end
