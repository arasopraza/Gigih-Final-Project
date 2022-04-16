class Customer < ApplicationRecord
    has_many :orders
    validates :name, :phone, presence: true
end
