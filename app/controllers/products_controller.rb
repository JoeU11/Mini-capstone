class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end

  def show
    product = Product.find_by(id: 1)
    render json: product.as_json
  end

  def create
    product = Product.new(name: params[:name], price: params[:price], description: params[:description])
    product.save
    render json: product.as_json
  end
end
