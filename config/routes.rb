 Rails.application.routes.draw do


  devise_for :users,
     controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'


  root to: 'pages#home'

  resources :own_contents do
    member do
      put "like" => "own_contents#like"
    end
    resources :own_content_comments, only: [:index, :new, :create, :show]
    resources :favourites, only: [:new, :create,:destroy]
  end



  resources :didyouknows do
  end

 get '/library', to: 'pages#library'
 get '/newsfeed', to: 'pages#newsfeed'
 get '/favourites', to: 'favourites#index'

  resources :users, only: [:show, :edit, :update]
      # post "users/:id", to: "users#show"
      # get "users/:id/edit", to: "users#edit"
      # patch "users/:id", to: "users#update"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

