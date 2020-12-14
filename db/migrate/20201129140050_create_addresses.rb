class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :id
      t.integer :end_user_id
      t.string :post_code
      t.string :address
      t.string :name

      t.timestamps      
    end
  end
end
