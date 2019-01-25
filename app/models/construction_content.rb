class ConstructionContent < ApplicationRecord
  belongs_to :quotation_list, foreign_key: :quotation_list_id

  default_scope { order(position: :desc) }
end
