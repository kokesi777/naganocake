class Order < ApplicationRecord
    has_many :end_users
    has_many :items

    enum status: {

    }
end
