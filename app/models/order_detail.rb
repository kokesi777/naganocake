class OrderDetail < ApplicationRecord
    has_many :end_users
    belongs_to :item
    belongs_to :order
end
