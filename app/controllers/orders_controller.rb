class OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    subtotal = 0
    carted_products.each do |carted_product|
      subtotal = carted_product.quantity * carted_product.product.price
    end
    tax = subtotal * 0.09
    total = subtotal + tax
    order = Order.new(user_id: current_user.id, subtotal: subtotal, tax: tax, total: total)
    order.save
    carted_products.each do |carted_product|
      carted_product.order_id = order.id
      carted_product.status = "purchased"
      carted_product.save
    end
    render json: order.as_json
  end

  def index
    orders = current_user.orders
    render json: orders.as_json
  end

  def show
    order = Order.find_by(id: params[:id]) 
    if current_user.id == order.user_id
      render json: order.as_json
    else
      render json: {message: "Error. You may only view your orders"}, status: :unauthorized
    end
  end
end
