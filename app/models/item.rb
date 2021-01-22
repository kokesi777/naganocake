class Item < ApplicationRecord
    belongs_to :genre
    belongs_to :order
    has_many :cart_item
end
