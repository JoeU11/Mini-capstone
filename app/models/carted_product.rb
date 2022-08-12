class CartedProduct < ApplicationRecord
  belongs_to :user
  # belongs_to :order # think this might require an order for all carted products (not good), test later?
  belongs_to :product
end
