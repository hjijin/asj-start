class QuotationListItem < ApplicationRecord
  belongs_to :quotation_list
  has_many :quotation_list_line_items
end
