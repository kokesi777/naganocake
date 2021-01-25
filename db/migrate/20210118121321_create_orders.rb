class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.string :payment_method
      t.string :post_code
      t.string :address
      t.string :name
      t.integer :cost, default: 800
      t.integer :total_payment
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
