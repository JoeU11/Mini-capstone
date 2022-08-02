class AddInventory < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :inventory, :string
  end
end
