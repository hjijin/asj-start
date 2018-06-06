class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def not_authenticated
    flash[:warning] = '你需要登录才能访问这个页面。'
    redirect_to log_in_path
  end
end
