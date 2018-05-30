class MealsController < ApplicationController
  def index
    @meals = Meal.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day, active: true)
  end

  def show

  end

  def new
    @meal = Meal.new
    @staffs = Staff.all.where(active: true)
  end

  def create
    if params[:staff_ids].present?
      params[:staff_ids].each do |staff|
        Meal.create(staff_id: staff)
      end
      flash[:success] = "补订餐成功！"
      redirect_to meals_path
    elsif Meal.book_limit(current_user) > 0
      flash[:warning] = "你已经订过了！"
      redirect_to meals_path
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