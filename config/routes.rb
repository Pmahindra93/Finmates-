Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'

  resources :own_contents do
    member do
      put "like" => "own_contents#like"
    end
    resources :comments, only: [:index, :new, :create, :show]
  end

  resources :third_party_contents do
  end

 get '/library', to: 'pages#library'
 get '/newsfeed', to: 'pages#newsfeed'

  resources :users, only: [:index, :show]
      # get "users/:id", to: "users#show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

