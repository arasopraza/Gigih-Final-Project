class DropItemCategories < ActiveRecord::Migration[7.0]
  def change
    drop_table :item_categories
  end
end
