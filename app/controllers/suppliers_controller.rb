class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render json: @suppliers.as_json
  end
  
  def show
    @supplier = Supplier.find_by(id: params[:id])
    render json: @supplier.as_json
  end

  def create
    @supplier = Supplier.new(name: params[:name], email: params[:email], phone_number: params[:phone_number])
    supplier.save
    render json: @supplier
  end

  def update
    @supplier = Supplier.find_by(id: params[:id])
    @supplier.name = params[:name]
    @supplier
    @supplier.save
    render json: @supplier
  end

  def destroy
    @supplier = Supplier.find_by(id: params[:id])
  end
end
