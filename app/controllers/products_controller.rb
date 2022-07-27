class ProductsController < ApplicationController
  def soccer_ball
    product = Product.find_by({name: "Soccer Ball"})
    render json: product
  end

  def all_products
    render json: Product.all
  end
end
