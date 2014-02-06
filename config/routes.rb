Depot::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "customers#new", :as => "signup"
  # get "admin" 

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

  resources :types

  resources :authors

    root to: "store#index", as: 'store' 
    get '/stories', to: redirect('/products')
end
