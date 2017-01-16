class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = t ".invalid_login_message"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    flash[:notice] = t ".logout_success_message"
    redirect_to root_url
  end
end
