class ProfileController < ApplicationController
  def password
  end

  def update_password
    if current_user.valid_password?(params[:old_password])
      current_user.password_confirmation = params[:password_confirmation]

      if current_user.change_password!(params[:password])
        flash[:success] = "密码修改成功。"
        redirect_to password_path
      else
        flash[:error] = "密码修改失败。"
        render action: :password
      end
    else
      flash[:warning] = "旧密码不正确。"
      render action: :password
    end
  end
end