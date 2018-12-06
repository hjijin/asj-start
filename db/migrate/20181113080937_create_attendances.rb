class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.date :date_at
      t.string :name
      t.string :account
      t.string :department
      t.string :rule
      t.integer :times_count
      t.string :work_hours
      t.string :approval
      t.string :status
      t.string :calibration
      t.string :start_work
      t.string :end_work

      t.timestamps
    end
  end
end
