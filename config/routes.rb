Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")

  root "lists#index"
    resources :lists, only: [:index, :show, :new, :create, :destroy] do
      resources :bookmarks, only: [:new, :create]
      resources :reviews, only: :create
    end
    resources :bookmarks, only:[:destroy]
    resources :reviews, only:[:destroy]
  # get "/lists/new", to:"lists#new"
  # get "/lists/:id", to:"lists#show", as: :show_detail
  # post "/lists", to:"lists#create"
  # get "lists/1/bookmarks/new" new
  # get "lists/1/bookmarks" create
  # delete "bookmarks/25" destroy
end
