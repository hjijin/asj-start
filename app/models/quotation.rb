class Quotation < ApplicationRecord

  validates :quotation_category0_id, presence: { message: "标准分类不能为空。" }
  validates :quotation_category1_id, presence: { message: "工程分类不能为空。" }
  validates :quotation_category2_id, presence: { message: "设计分类不能为空。" }
  validates :code, presence: { message: "项目编码不能为空。" }
  validates :name, presence: { message: "项目名称不能为空。" }
  validates :material_costs, presence: { message: "材料费不能为空。" }
  validates :labor_costs, presence: { message: "人工费不能为空。" }
  validates :remark, presence: { message: "描述不能为空。" }

  belongs_to :quotation_category, optional: true
end
