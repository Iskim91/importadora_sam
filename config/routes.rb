Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :baskets do
    resources :payments, only: :new
    resources :transactions, only: [:show, :edit, :destroy, :update]
    member do
      get "/payment", to: "baskets#payment"
    end
  end

  resources :clothes do
    resources :transactions, only: :create
  end

  mount StripeEvent::Engine, at: '/stripe-webhooks'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
