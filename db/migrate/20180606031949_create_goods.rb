class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.integer :staff_id
      t.decimal :price, precision: 5, scale: 2
      t.text :remark

      t.timestamps
    end
  end
end
