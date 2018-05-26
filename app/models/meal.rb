class Meal < ApplicationRecord
  belongs_to :staff, optional: true

  def self.book_limit(current_user)
    current_user.meals.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day, active: true).count
  end
end
