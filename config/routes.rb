Rails.application.routes.draw do
  get 'pages/index'
  resource :example, constraints: -> { Rails.env.development? }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :games, only: [:show, :create, :index] do
    resources :cards
    collection do
      get :join
    end
  end

  # Defines the root path route ("/")
  root "home#show"
end
