Top300de::Application.routes.draw do

  root "default#home"
  get "users/index"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  resources :users, only:[:new, :create]
  resources :trips do
    resources :feedback
  end

  namespace :admin do
    get 'dasboard', to: "dashboard#index"
    resources :categories
    resources :hotels
    resources :feedback
    resources :restaurants
    resources :paintings
    resources :trips do
      collection do
        get 'load_trips'
      end
    end
  end

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :categories, only: [:index]
    end
  end

end
