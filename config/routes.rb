Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :own_content do
   resources 'comments', only: [:index, :new, :create, :show]
   resources 'favourites', only: [:index, :new, :create, :show]
  end

  resources :third_party_content do
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
