class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string  :name, comment: "名称"
      t.string  :description, comment: "描述"
      t.integer :position, default: 0, comment: "顺序"
      t.boolean :active, default: true, comment: "有效？"

      t.timestamps
    end
  end
end
