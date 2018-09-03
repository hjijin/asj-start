class QuotationList < ApplicationRecord
  validates_presence_of :title, message: "项目名称不能为空"
  validates_presence_of :owner, message: "业主不能为空"
  validates_presence_of :address, message: "工程地址不能为空"
  validates_presence_of :maker, message: "制单人不能为空"

  belongs_to :editor, class_name: "Staff"
  has_many :quotation_list_items, dependent: :destroy

  validates :status, inclusion: { in: %w(draft),
    message: "%{status} 不是一个合法的状态" }
end
