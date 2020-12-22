class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|

      t.timestamps
      t.string :postal_code, null:false
      t.integer :shipping_area_id, null:false
      t.string :city, null:false
      t.string :address, null:false
      t.string :building
      t.string :phone_number, null:false
      t.references :buy, foreign_key: true
    end
  end
end
