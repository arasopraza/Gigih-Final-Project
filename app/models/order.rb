class Order < ApplicationRecord
    belongs_to :customer, optional: true
    has_many :order_detail
    validates :customer_id, :total, :order_date, presence: true
    validates :total, numericality: true
end
