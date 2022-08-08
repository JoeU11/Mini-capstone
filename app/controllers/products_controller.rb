class ProductsController < ApplicationController  
  def index
    @products = Product.all   
    render template: "products/index"
    # render json: products.as_json(methods: [:friendly_created_at, :is_discounted?, :tax, :total])
  end

  def show
    @product = Product.find_by(id: params[:id])
    render template: "products/show"
  end

  def create
    @product = Product.new(name: params[:name], price: params[:price], description: params[:description], supplier_id: params[:supplier_id])
    if @product.save
      if params[:image_url]
        image = Image.new(url: params[:image_url], product_id: @product.id) #to add multiple at a time, pass array of image urls instead of a single string
        image.save
      end 
      render template: "products/show"
    else
      render json: @product.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    if @product.save 
      render template: "products/show"
    else
      render json: @product.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: {message: "It's gone! (hopefully)"}
  end
end
