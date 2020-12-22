class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|

      t.timestamps
      t.references :item, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
