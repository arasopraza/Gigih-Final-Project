class RenameItemIdToMenuId < ActiveRecord::Migration[7.0]
  def change
    rename_column :item_categories, :item_id, :menu_id
  end
end
