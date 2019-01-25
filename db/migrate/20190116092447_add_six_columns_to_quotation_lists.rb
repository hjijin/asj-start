class AddSixColumnsToQuotationLists < ActiveRecord::Migration[5.2]
  def change
    add_column :quotation_lists, :commencement_date, :date, comment: "施工日期"
    add_column :quotation_lists, :construction_manager, :string, comment: "施工负责人"
    add_column :quotation_lists, :construction_manager_phone, :string, comment: "施工负责人电话"
    add_column :quotation_lists, :design, :string, comment: "设计"
    add_column :quotation_lists, :design_phone, :string, comment: "设计电话"
    add_column :quotation_lists, :budget, :decimal, comment: "预算"
    add_column :quotation_lists, :in_province, :boolean, default: false, comment: "是否省外"
    add_column :quotation_lists, :owner_phone, :string, comment: "客户电话"
  end
end
