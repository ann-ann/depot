Depot::Application.routes.draw do

  resources :order_items

  resources :orders

  resources :products
    root to: "store#index", as: 'store' 
    get '/stories', to: redirect('/products')
end
