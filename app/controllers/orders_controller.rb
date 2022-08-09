class OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    order = Order.new(product_id: params[:product_id], quantity: params[:quantity], user_id: current_user.id)
    product = Product.find_by(id: params[:product_id])
    order.subtotal = product.price * order.quantity
    order.tax = order.subtotal * 0.06 #ideally tax would not be hardcoded
    order.total = order.subtotal + order.tax
    order.save
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
