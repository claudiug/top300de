Top300de::Application.routes.draw do
  get '/register', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/about', to: 'default#about'
  get '/sitemap', to: 'default#sitemap'

  scope ":locale", locale: /en|de/ do
    root "default#home"
    resources :users, only:[:new, :create]
    resources :trips, only:[:index, :show]
  end

  get '', to: redirect("/#{I18n.default_locale}")

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
