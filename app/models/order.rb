class Order < ApplicationRecord
    validates :customer_id, :total, :order_date, presence: true
    validates :total, numericality: true
end
