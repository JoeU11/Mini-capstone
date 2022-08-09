class ImagesController < ApplicationController
  before_action :authenticate_admin
  
  def create
    image = Image.new(name: params[:url], product_id: params[:product_id])
    image.save
    render json: image.as_json
  end
end
