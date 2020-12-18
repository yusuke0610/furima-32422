class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string     :title,            null: false
      t.text       :explanation,      null: false
      t.integer    :category_id,      null: false
      t.integer    :condition_id,     null: false
      t.integer    :delivery_fee_id,  null: false
      t.integer    :shipping_area_id, null: false
      t.integer    :days_ship_id,     null: false
      t.integer    :value,            null: false
      t.references :user,             foreign_key: true

    end
  end
end
