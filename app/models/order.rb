class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product # not sure about this one. THink a table can be linked multiple times. 
end
