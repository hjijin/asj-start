class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  layout 'layouts/sessions_layout'

  def new
  end

  def create
    staff = Staff.find_by(phone: params[:phone])
    if staff.blank? || !staff.active?
      flash.now[:warning] = '用户不存在!'
      render 'new'
    elsif login(params[:phone], params[:password], params[:remember_me])
      flash[:success] = '欢迎回来!'
      redirect_back_or_to root_path
    else
      flash.now[:warning] = '手机号或者密码错误!'
      render 'new'
    end
  end

  def destroy
    logout
    flash[:success] = '明天见。'
    redirect_to log_in_path
  end
end
