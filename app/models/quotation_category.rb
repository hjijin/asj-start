class QuotationCategory < ApplicationRecord
  has_ancestry

  validates :title, presence:   { message: "名称不能为空！" }
  validates :title, uniqueness: { message: "名称不能重复！"}
  validates :ancestry, presence:   { message: "分类不能为空！" }

  has_many :quotations, foreign_key: "quotation_category1_id", dependent: :destroy

  before_validation :corrent_ancestry

  private
  def corrent_ancestry
    self.ancestry = nil if self.ancestry.blank?
  end
end
