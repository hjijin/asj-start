class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :uuid
      t.string :title
      t.string :subtitle
      t.string :publisher
      t.string :image
      t.integer :borrow_id
      t.date  :borrow_date
      t.integer :borrow_times, default: 0

      t.timestamps
    end
  end
end
