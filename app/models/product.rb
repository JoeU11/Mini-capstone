class Product < ApplicationRecord
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
    price * 0.09
  end

  def total
    price + tax
  end
end
