class CartedProduct < ApplicationRecord
  belongs_to :user
  belongs_to :order, optional: true
  belongs_to :product

  def product_name
    return product.name
  end

  def product_price
    return product.price
  end

  def product_description
    return product.description
  end
end
