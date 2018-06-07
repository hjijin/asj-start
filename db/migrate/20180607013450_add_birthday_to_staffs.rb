class AddBirthdayToStaffs < ActiveRecord::Migration[5.2]
  def change
    add_column :staffs, :birthday, :string
  end
end
