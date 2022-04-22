class Order < ApplicationRecord
    belongs_to :customer, optional: true
    has_many :order_details
    has_many :categories, through: :categorizations
    validates :customer_id, :total, :order_date, presence: true
    validates :total, numericality: true
end
