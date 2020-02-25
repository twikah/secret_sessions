Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions do
    resources :bookings, only: [:index, :new, :create]
  end

  resources :bookings, only: [:show] do
    collection do                     # collection => no restaurant id in URL
      get 'dashboard'                       # RestaurantsController#top
    end
  end
end
