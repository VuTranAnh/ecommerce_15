class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include ApplicationHelper

  private
  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t ".page_notfound"
      redirect_to root_url
    end
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = t ".please_log_in"
      redirect_to login_path
    end
  end
end
