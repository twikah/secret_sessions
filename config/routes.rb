Rails.application.routes.draw do
  devise_for :users


  devise_scope :user do
    root to: 'pages#home'
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end

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
