class Quotation < ApplicationRecord

  validates :quotation_category_id, presence: { message: "分类不能为空。" }
  validates :remark, presence: { message: "描述不能为空。" }

  belongs_to :quotation_category, optional: true
end
