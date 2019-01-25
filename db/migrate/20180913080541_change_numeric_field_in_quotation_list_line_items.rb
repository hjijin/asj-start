class ChangeNumericFieldInQuotationListLineItems < ActiveRecord::Migration[5.2]
  def change
    change_Column :quotation_list_line_items, :quantity, :decimal, precision: 6, scale: 2, null: false, default: 0
  end
end
