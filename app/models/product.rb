class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  # validate :greater_than_zero
  validates :price, numericality: { greater_than: 0}
  # validate :description_length
  validates :description, presence: true
  validates :description, length: { in: 10..500}

  # def greater_than_zero
  #   if price <= 0
  #     errors.add(:price, "Price must be greater than zero")
  #   end
  # end

  # def description_length
  #   if description.length < 10 || description.length > 500
  #     errors.add(:description, "Description must be between 10 and 500 characters")
  #   end
  # end

  def supplier
    Supplier.find_by(id: supplier_id)
  end

  def friendly_created_at
    created_at.strftime("%B %e, %Y")
  end

  def is_discounted?
    # if price <= 10
    #   true
    # else
    #   false
    # end
    price <=10
  end

  def tax
    tax_rate = 0.09
    price * tax_rate
  end

  def total
    price + tax
  end
end
