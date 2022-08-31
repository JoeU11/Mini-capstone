class CartedProductsController < ApplicationController
  before_action :authenticate_user
  
  def index 
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    subtotal = 0
    render template: "carted_products/index"
  end

  def create
    carted_product = CartedProduct.new(user_id: current_user.id, product_id: params[:product_id], quantity: params[:quantity], status: "carted")
    carted_product.save

    render json: carted_product.as_json
  end

  def destroy
    if params[:delete_all]
      carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
      carted_products.each do |carted_product|
        carted_product.status = "removed"
        carted_product.save
      end
      render json: {message: "Your cart is now empty"}
    else
      carted_product = CartedProduct.find_by(id: params[:id])
      carted_product.status = "removed"
      carted_product.save
      render json: {message: "This item has been removed"}
    end
  end

  def update
    carted_product = CartedProduct.find_by(id: params[:id])
    if carted_product[:status] == "carted"
      carted_product.quantity = params[:quantity] || carted_product.quantity
      carted_product.save
      render json: carted_product
    else
      render json: {message: "you may only change the quantity of items in your cart"}, status: :unauthorized
    end
  end
end
