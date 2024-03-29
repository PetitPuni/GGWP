require "sidekiq/web"

Rails.application.routes.draw do
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :leagues do
    resources :challenges, only: [:show, :index]
    resources :user_leagues, only: [:index, :show]
  end

  resources :users, only: [:show, :edit, :update, :destroy]

  mount Sidekiq::Web => '/sidekiq'

  get 'leagues/:id/join', to: 'leagues#join', as: 'join_league'
  # get 'leagues/:id/start', to: 'leagues#start', as: 'start_league'

  get 'steam/connect', to: 'steam#connect'
  get 'steam/callback', to: 'steam#callback'
  get 'user_leagues/my_stats', to: 'user_leagues#my_stats'
  get 'steam/get_stats', to: 'steam#get_stats'
  get '/user_leagues', to: 'user_leagues#index'
  # get '/my_challenges', to: 'user_leagues#my_challenges'


  # Defines the root path route ("/")
  # root "articles#index"
end
