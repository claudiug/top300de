Top300de::Application.routes.draw do

  get "users/index"
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  root "searches#new"

  resources :trips
  resources :default
  resources :searches

  namespace :admin do
    resources :users
  end

end
