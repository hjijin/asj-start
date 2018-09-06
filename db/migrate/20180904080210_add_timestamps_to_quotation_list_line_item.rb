class AddTimestampsToQuotationListLineItem < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :quotation_list_line_items, null: true

    add_time = DateTime.now
    QuotationListLineItem.update_all(created_at: add_time, updated_at: add_time)

    change_column_null :quotation_list_line_items, :created_at, false
    change_column_null :quotation_list_line_items, :updated_at, false
  end
end
