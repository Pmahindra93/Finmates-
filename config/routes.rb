Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root to: 'pages#home'

  resources :own_contents do
    member do
      put "like" => "own_contents#like"
    end
    resources :own_content_comments, only: [:index, :new, :create, :show]
    resources :favourites, only: [:new, :create]
  end



  resources :didyouknows do
  end

 get '/library', to: 'pages#library'
 get '/newsfeed', to: 'pages#newsfeed'
 get '/favourites', to: 'favourites#index'

  resources :users, only: [:index, :show]
      # get "users/:id", to: "users#show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

