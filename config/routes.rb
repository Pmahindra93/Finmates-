Rails.application.routes.draw do

  devise_for :users do
    get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  end

  root to: 'pages#home'

  resources :own_contents do
    member do
      put "like" => "own_contents#like"
    end
    resources :own_content_comments, only: [:index, :new, :create, :show]
    resources :favourites, only: [:index, :new, :create, :show]
  end

  resources :third_party_contents do
  end

  resources :users, only: [:index, :show]
      # get "users/:id", to: "users#show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

