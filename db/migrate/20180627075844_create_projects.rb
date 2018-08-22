class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name, comment: "工程名称"
      t.date :start_date
      t.integer :area
      t.decimal :main_material
      t.decimal :sub_material
      t.string :designer
      t.integer :assistant_id
      t.integer :level2_assistant_id
      t.integer :level3_assistant_id
      t.integer :project_manager_id
      t.integer :project_assistant_id
      t.integer :status
      t.string :detail
      t.integer :partner, default: [], array: true
      t.integer :editor_id

      t.timestamps
    end
  end
end
