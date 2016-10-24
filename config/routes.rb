Rails.application.routes.draw do
  root "home#index"

  resources :categories, only: [:index, :show, :new, :create] do
    resources :products, only: [:index, :show]
  end

  resources :orders, only: [:new, :create]
  get "order" => "orders#show"
  get "orders/edit" => "orders#edit"
  patch "orders/update" => "orders#update"
  get "orders/confirmation" => "orders#purchase", as: "confirmation"

  resources :order_items, only: [:delete]

  resources :products, only: [:index, :show] do
    resources :reviews, only: [:index, :show, :new, :create]
  end
  get 'products/:id/add_to_cart' => "products#add_to_cart", as: "add_to_cart"


  resources :merchants, only: [:show] do
    resources :products, except: [:delete] do
      resources :reviews, only: [:show, :new, :create,:index]
    end
    resources :categories, except: [:edit, :update, :delete]
    resources :orders, only: [:index, :show]
  end

  get "/auth/:provider/callback" =>  "sessions#create"
  get "/sessions/additional_info", to: "sessions#new", as: "new_session"
  patch "/sessions/additional_info", to: "sessions#update", as: "additional_info"
  get "/sessions/login_failure", to: "sessions#login_failure", as: "login_failure"
  get "sessions" => "sessions#index"
  delete "sessions", to: "sessions#destroy"
end
