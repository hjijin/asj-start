class CreateWatchBills < ActiveRecord::Migration[5.2]
  def change
    create_table :watch_bills do |t|
      t.date :duty_date
      t.integer :dayshift, array: true, default: []
      t.integer :nightshift, array: true, default: []
      t.string :remark
      t.integer :staff_id

      t.timestamps
    end
  end
end
