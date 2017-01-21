class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include ApplicationHelper

  private
  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t "page_notfound"
      redirect_to root_url
    end
  end

  def store_recently_viewed
    session[:history] ||= []
    session[:history].shift if session[:history].size >= Settings.recently_size
    session[:history] << params[:id] unless
      session[:history].include? params[:id]
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "please_log_in"
      redirect_to login_path
    end
  end

  def authorize_admin
    unless current_user
      store_location
      flash[:danger] = t "please_log_in"
      redirect_to login_path
    else
      unless current_user.is_admin?
        flash[:danger] = t "you_must_be_admin"
        redirect_to root_path
      end
    end
  end
end
