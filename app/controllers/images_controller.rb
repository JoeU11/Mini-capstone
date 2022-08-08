class ImagesController < ApplicationController
  def create
    image = Image.new(name: params[:url], product_id: params[:product_id])
    image.save
    render json: image.as_json
  end
end
