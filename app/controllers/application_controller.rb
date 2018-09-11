class ApplicationController < ActionController::Base
  include Pundit

  before_action :require_login

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def not_authenticated
    flash[:warning] = '你需要登录才能访问这个页面。'
    redirect_to log_in_path
  end

  def user_not_authorized(exception)
   policy_name = exception.policy.class.to_s.underscore

   flash[:error] = "你没有权限！"
   redirect_to(request.referrer || root_path)
 end
end
