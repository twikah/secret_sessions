Rails.application.routes.draw do
  devise_for :users
  root to: 'sessions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions do
    resources :bookings, only: [:index, :new, :create]
  end

  resources :bookings, only: [:show] do
    collection do
      get 'dashboard'
    end
  end
end
