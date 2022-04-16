class ItemCategory < ApplicationRecord
    belongs_to :category, optional: true
    belongs_to :menu_item, optional: true
    validates :item_id, :category_id, presence: true, uniqueness: true
end
