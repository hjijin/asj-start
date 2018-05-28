class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  layout 'layouts/sessions_layout'

  def new
  end

  def create
    if login(params[:phone], params[:password], params[:remember_me])
      flash[:success] = 'Welcome back!'
      redirect_back_or_to root_path
    else
      flash.now[:warning] = 'E-mail or password is incorrect.'
      render 'new'
    end
  end

  def destroy
    logout
    flash[:success] = 'See you!'
    redirect_to log_in_path
  end
end
