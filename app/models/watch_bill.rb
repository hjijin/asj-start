class WatchBill < ApplicationRecord
  belongs_to :staff, optional: true

  validates :duty_date, :dayshift, :nightshift, presence: true
end
