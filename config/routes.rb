Depot::Application.routes.draw do

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "customers#new", :as => "signup"

  resources :credit_cards

  resources :customers do
    # get "orders" => "orders#user_orders", :as => "orders"
  end

  resources :order_items

  resources :orders

  resources :products do
    get :who_bought, on: :member
  end

  resources :sessions

  resources :addresses

    root to: "store#index", as: 'store' 
    get '/stories', to: redirect('/products')
end
