class Categorization < ApplicationRecord
    belongs_to :category, optional: true
    belongs_to :menu, optional: true
    validates :menu_id, :category_id, presence: true
end