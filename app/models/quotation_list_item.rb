class QuotationListItem < ApplicationRecord
  validates_presence_of :title, message: "类目分组名称不能为空"
  validates_presence_of :weight, message: "权重不能为空"

  belongs_to :quotation_list
  has_many :quotation_list_line_items, dependent: :destroy
end
