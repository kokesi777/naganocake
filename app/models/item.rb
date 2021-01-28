class Item < ApplicationRecord
    belongs_to :genre
    belongs_to :order
    belongs_to :order_deatil
    has_many :cart_item
end
