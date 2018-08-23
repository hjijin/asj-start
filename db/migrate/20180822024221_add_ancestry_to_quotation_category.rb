class AddAncestryToQuotationCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :quotation_categories, :ancestry, :string
    add_index :quotation_categories, :ancestry
  end
end
