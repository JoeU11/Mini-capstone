class ChangeAdminToInteger < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :admin
    add_column :users, :admin, :integer, default: 0
  end
end
