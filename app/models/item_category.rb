class ItemCategory < ApplicationRecord
    validates :item_id, :category_id, presence: true, uniqueness: true
end
