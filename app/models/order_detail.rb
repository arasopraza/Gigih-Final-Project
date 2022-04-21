class OrderDetail < ApplicationRecord
    validates :menu_id, :order_id, presence: true
end
