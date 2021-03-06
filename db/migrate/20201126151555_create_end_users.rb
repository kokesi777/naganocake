class CreateEndUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :end_users do |t|
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.string :post_code
      t.string :address
      t.string :telephone_number
      t.boolean :is_delete,    default: false

      t.timestamps
    end
  end
end
