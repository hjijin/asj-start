class CreateQuotationLists < ActiveRecord::Migration[5.2]
  def change
    create_table :quotation_lists do |t|
      t.string :title, comment: "项目名称"
      t.string :maker, comment: "制单人"
      t.string :owner, comment: "业主"
      t.string :address, comment: "工程地址"
      t.string :status, default: "draft", comment: "项目状态"
      t.integer :editor_id

      t.timestamps
    end
  end
end
