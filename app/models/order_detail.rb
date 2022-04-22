class OrderDetail < ApplicationRecord
    belongs_to :order, optional: true
    belongs_to :menu, optional: true
    validates :menu_id, :order_id, presence: true
end
