Depot::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "customers#new", :as => "signup"
  
  scope '(:locale)' do
  resources :credit_cards

  resources :customers

  resources :order_items

  resources :orders 
  
  resources :addresses


  resources :products do
    get :who_bought, on: :member
  end

  resources :sessions



  root to: "store#index", as: 'store' 
  get '/stories', to: redirect('/products')
end
end
