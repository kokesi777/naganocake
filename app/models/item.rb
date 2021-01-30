class Item < ApplicationRecord
    belongs_to :genre
    belongs_to :order
    has_many :order_details
    has_many :cart_items
end
