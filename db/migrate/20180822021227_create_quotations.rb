class CreateQuotations < ActiveRecord::Migration[5.2]
  def change
    create_table :quotations do |t|
      t.integer :quotation_category_id
      t.string :code
      t.string :name
      t.string :unit
      t.integer :quantity
      t.decimal :material_costs, precision: 5, scale: 2
      t.decimal :labor_costs, precision: 5, scale: 2
      t.decimal :total_amount, precision: 5, scale: 2
      t.text :remark
      t.string :status, default: "on"

      t.timestamps
    end

    add_index :quotations, [:quotation_category_id]
    add_index :quotations, [:code]
    add_index :quotations, [:name]
  end
end
