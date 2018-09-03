class CreateQuotationListItems < ActiveRecord::Migration[5.2]
  def change
    create_table :quotation_list_items do |t|
      t.string :title
      t.integer :weight, default: 0, comment: "位置"
      t.integer :quotation_list_id

      t.timestamps
    end
  end
end
