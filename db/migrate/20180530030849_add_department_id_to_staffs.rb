class AddDepartmentIdToStaffs < ActiveRecord::Migration[5.2]
  def change
    add_column :staffs, :department_id, :string
  end
end
