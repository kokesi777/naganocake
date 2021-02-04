class OrderDetail < ApplicationRecord
    belongs_to :end_users
    belongs_to :item
    belongs_to :order
end
