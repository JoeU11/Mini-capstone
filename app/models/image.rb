class Image < ApplicationRecord
  validates :url, presence: true
  validates :product_id, presence: true
  belongs_to :product
end
