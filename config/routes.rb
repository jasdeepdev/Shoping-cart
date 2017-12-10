Rails.application.routes.draw do
  devise_for :sellers
    devise_for :users
  devise_for :models
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
      get 'shopping_cart/all'
      
      get 'orders/all'
      
      get '/orders/:id', to: 'orders#products', as: 'orders'
       root to: "shopping_cart#index"
        resources :shopping_cart, as: :product  do 
              resources :orders
          end



        get 'seller_side_products/all'
        root to: "seller_side_products_controller#index"
        resources :seller_side_products

end
