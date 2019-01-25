class CreateConstructionContents < ActiveRecord::Migration[5.2]
  def change
    create_table :construction_contents do |t|
      t.integer :quotation_list_id
      t.string :title
      t.text :content
      t.integer :position

      t.timestamps
    end
  end
end
