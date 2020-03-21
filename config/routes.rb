Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "/history", to: "users#history"
  resources :baskets do
    resources :payments, only: :new
    resources :transactions, only: [:show, :edit, :destroy, :update]
    member do
      get "/payment", to: "baskets#payment"
    end
  end

  resources :details, only: :destroy

  resources :clothes do
    member do
      patch "/publish", to: "clothes#publish"
      patch "/unpublish", to: "clothes#unpublish"
    end
    resources :transactions, only: :create
    resources :details, only: :create
  end

  mount StripeEvent::Engine, at: '/stripe-webhooks'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
