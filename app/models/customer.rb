class Customer < ApplicationRecord
    has_many :orders
    validates :name, :phone, :email, presence: true
    validates :email, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
end
