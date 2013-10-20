Top300de::Application.routes.draw do

  root "default#home"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  resources :users, only:[:new, :create]
  resources :trips, only:[:index, :show]


  namespace :admin do
    get 'dashboard', to: "dashboard#index"
    resources :categories
    resources :hotels
    resources :feedback
    resources :restaurants
    resources :paintings
    resources :trips do
      collection do
        get 'load_trips'
        put 'discontinue'
      end
    end
  end

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :categories, only: [:index]
    end
  end

end
