module QuotationListItemsHelper
  def get_quotations(category_id)
    Quotation.where(quotation_category0_id: category_id)
  end
end
