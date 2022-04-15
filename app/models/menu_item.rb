class MenuItem < ApplicationRecord
    validates :name, presence: true, length: { minimum: 2 }, uniqueness: true
    validates :description, presence: true, length: { maximum: 150 }
    validates :price, numericality: { greater_than_or_equal_to: 0.01 }
end