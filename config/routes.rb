Rails.application.routes.draw do
  resources :passwords, controller: 'clearance/passwords', only: %i[create new]
  resource :session, controller: 'clearance/sessions', only: [:create]
  root 'posts#index'
  # resources :users, controller: "clearance/users", only: [:create] do
  #   resource :password,
  #     controller: "clearance/passwords",
  #     only: [:create, :edit, :update]
  # end

  get '/sign_in' => 'clearance/sessions#new', as: 'sign_in'
  post '/login' => 'clearance/sessions#create', as: 'login'
  delete '/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'
  get '/sign_up' => 'clearance/users#new', as: 'sign_up'
  get 'new', to: 'posts#new'
  get 'edit', to: 'posts#posts'
  get 'show', to: 'posts#show'

  resources :users do
    resources :follows
    collection do
      get :users_api
    end
  end

  resources :posts do
    resources :likes, only: [:create]
    resources :comments, only: [:create]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
