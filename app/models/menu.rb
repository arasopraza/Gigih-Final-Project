class Menu < ApplicationRecord
    has_many :item_categories
    validates :name, presence: true, length: { minimum: 2 }, uniqueness: true
    validates :description, length: { maximum: 150 }
    validates :price, numericality: { greater_than_or_equal_to: 0.01 }
end