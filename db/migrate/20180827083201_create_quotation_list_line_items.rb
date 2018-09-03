class CreateQuotationListLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :quotation_list_line_items do |t|
      t.integer :quotation_category0_id
      t.integer :quotation_category1_id
      t.integer :quotation_category2_id
      t.string :code
      t.string :name
      t.string :unit
      t.integer :quantity
      t.decimal :material_costs, precision: 7, scale: 2
      t.decimal :labor_costs, precision: 7, scale: 2
      t.decimal :total_amount, precision: 7, scale: 2
      t.text :remark
      t.integer :quotation_list_item_id
    end

    add_index :quotation_list_line_items, [:quotation_category0_id]
    add_index :quotation_list_line_items, [:quotation_category1_id]
    add_index :quotation_list_line_items, [:quotation_category2_id]
    add_index :quotation_list_line_items, [:quotation_list_item_id]
  end
end
