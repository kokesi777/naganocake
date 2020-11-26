class CreateEndUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :end_users do |t|
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.string :email
      t.string :post_code
      t.string :address
      t.string :telephone_number
      t.string :encrypted_password
      t.boolean :is_delete

      t.timestamps
    end
  end
end
