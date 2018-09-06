class QuotationListLineItem < ApplicationRecord
  belongs_to :quotatio_list_item, optional: true

  before_update :set_total_amount

  default_scope { order('created_at ASC') }

  private
  def set_total_amount
    if self.quantity > 0
      self.total_amount = self.quantity * (self.material_costs + self.labor_costs)
    end
  end
end
