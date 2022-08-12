class CartedProductsController < ApplicationController
  def index
    if current_user # may not be necessary if only logged in users can see option to show all orders
      carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
      render json: carted_products.as_json #replace with template

    else
      render json: {message: "You must be logged in to view your order"}
    end
  end
end
