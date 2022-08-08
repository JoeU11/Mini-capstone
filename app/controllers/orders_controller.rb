class OrdersController < ApplicationController
  def create
    if current_user
      order = Order.new(product_id: params[:product_id], quantity: params[:quantity], user_id: current_user.id)
      product = Product.find_by(id: params[:product_id])
      order.subtotal = product.price * order.quantity
      order.tax = order.subtotal * 0.06 #ideally tax would not be hardcoded
      order.total = order.subtotal + order.tax
      order.save
    else
      render json: {message: "You must be logged in to place an order"}
    end

    render json: order.as_json
  end

  def index
    if current_user
      orders = current_user.orders
      render json: orders.as_json
    else
      render json: {message: "You must be logged in to view orders"}
    end
  end

  def show
    if current_user
      order = Order.find_by(id: params[:id]) 
      if current_user.id == order.user_id
        render json: order.as_json
      else
        render json: {message: "Error. You may only view your orders"}
      end
    else
      render json: {message: "You must be logged in to view orders"}
    end
  end
end
