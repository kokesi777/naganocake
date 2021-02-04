class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :cart_items
  has_many :order
  has_many :order_detail

  def active_for_authentication?
    super && (self.is_delete == false)
  end
end
