class CreateShoppings < ActiveRecord::Migration[5.2]
  def change
    create_table :shoppings do |t|
      t.belongs_to  :staff
      t.decimal     :total
      t.text        :remark
      t.string      :buyer
      t.date        :shopping_date

      t.timestamps
    end
  end
end
