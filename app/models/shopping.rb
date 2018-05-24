class Shopping < ApplicationRecord
  belongs_to :staff, optional: true

  validates :buyer, :total, :shopping_date, presence: true
end
