class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end

  def show
    product = Product.find_by(id: params[:id])
    render json: product.as_json
  end

  def create
    product = Product.new(name: params[:name], price: params[:price], description: params[:description])
    product.save
    render json: product.as_json
  end

  def update
    product = Product.find_by(id: params[:id])
    product.name = "Full-sized Goal"
    product.price = 300
    product.image_url = "https://kwikgoal.com/wp-content/uploads/2020/01/w2B3006_1-scaled.jpg"
    product.description = "A full sized soccer goal for official matches."
    product.save
    render json: product.as_json
  end
end
