class CreateQuotationCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :quotation_categories do |t|
      t.string :title
      t.integer :weight, default: 0, comment: "位置"

      t.timestamps
    end

    add_index :quotation_categories, [:title]
  end
end
