class DashboardController < ApplicationController
  def index
    @count_meals = Meal.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day, active: true).count
    @shopping = Shopping.last
    @average = (@shopping.total / @count_meals).round(2)
  end
end
