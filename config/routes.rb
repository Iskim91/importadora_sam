Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :clothes do
    resources :transactions do
      member do
        get "confirmation", to: "transactions#confirmation"
      end
      resources :payments, only: :new
    end
  end
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
