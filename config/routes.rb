Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # products
  get "/products" => "products#index" #everyone

  get "/products/:id" => "products#show" #everyone

  post "/products" => "products#create" #admin

  patch "/products/:id" => "products#update" #admin

  delete "/products/:id" => "products#destroy" #admin

  # Suppliers
  get "/suppliers" => "suppliers#index" #everyone

  get "/suppliers/:id" => "suppliers#show" #everyone

  post "/suppliers" => "suppliers#create" #admin

  patch "/suppliers/:id" => "suppliers#update" #admin

  delete "/suppliers/:id" => "suppliers#destroy" #admin

  # Images
  post "/images" => "images#create" #admin

  # Users
  post "/users" => "users#create" #everyone

  #login
  post "/sessions" => "sessions#create" #everyone

  #create order
  post "/orders" => "orders#create" #logged in

  get "/orders" => "orders#index" #logged in

  get "/orders/:id" => "orders#show" #logged in

  ############ Carted Products

  get "/carted_products" => "carted_products#index"

  post "/carted_products" => "carted_products#create"

  delete "/carted_products/:id" => "carted_products#destroy"

  delete "/carted_products" => "carted_products#destroy" # not sure if this is standard. Delete all should work with either delete route

  patch "/carted_products/:id" => "carted_products#update"
end
