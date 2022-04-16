class Order < ApplicationRecord
    belongs_to :customer, optional: true
    validates :customer_id, :total, :order_date, presence: true
    validates :total, numericality: true
end
