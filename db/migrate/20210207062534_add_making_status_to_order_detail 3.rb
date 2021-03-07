class AddMakingStatusToOrderDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :order_details, :making_status, :integer,    default: false
  end
end
