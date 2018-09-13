class ChangeQuantityToDecimal < ActiveRecord::Migration[5.2]
  def change
    QuotationListLineItem.update_all(quantity: 0)
    change_column :quotation_list_line_items, :quantity, :decimal, precision: 4, scale: 2, null: false, default: 0
  end
end
