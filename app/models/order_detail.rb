class OrderDetail < ApplicationRecord
    has_many :end_usres
    has_many :items
    belongs_to :order
end
