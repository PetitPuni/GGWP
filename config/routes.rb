Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :leagues do
    resources :challenges, only: [:show, :index]
    resources :user_leagues, only: [:index, :show]
  end
  resources :users, only: [:show, :edit, :update, :destroy]

  # Defines the root path route ("/")
  # root "articles#index"
end
