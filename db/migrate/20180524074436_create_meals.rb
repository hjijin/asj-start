class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.bigint :staff_id
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
