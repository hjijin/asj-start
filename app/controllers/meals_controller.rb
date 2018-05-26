class MealsController < ApplicationController
  def index
    @meals = Meal.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day, active: true)
  end

  def show

  end

  def create
    if Meal.book_limit(current_user) > 0
      flash[:warning] = "你已经订过了！"
      return redirect_to meals_path
    elsif Meal.create(staff_id: params[:staff_id])
      flash[:success] = "订餐成功！"
      redirect_to meals_path
    else
      flash[:error] = "订餐失败。"
    end
  end

  def destroy
    meal = Meal.find(params[:id])
    if meal.destroy
      flash[:success] = "取消成功！"
      redirect_to meals_path
    end
  end
end