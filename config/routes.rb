Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/soccer-ball" => "products#soccer_ball"

  get "/all-products" => "products#all_products"
end
