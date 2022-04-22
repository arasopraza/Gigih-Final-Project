class DropOrderDetails < ActiveRecord::Migration[7.0]
  def change
    drop_table :order_details
  end
end
