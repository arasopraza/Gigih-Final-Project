class Category < ApplicationRecord
    has_many :categorizations
    has_many :menus, through: :categorizations
    validates :name, presence: true, uniqueness: true
end
