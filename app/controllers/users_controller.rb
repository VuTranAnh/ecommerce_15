class UsersController < ApplicationController
  before_action :load_user, only: [:edit, :show, :update]
  before_action :correct_user, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t ".welcome_message"
      log_in @user
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @user.update_attributes user_params
      flash[:notice] = t ".profile_updated"
      redirect_to @user
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :address, :phone, :password,
      :password_confirmation, :avatar
  end

  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t ".page_notfound"
      redirect_to root_url
    end
  end

  def correct_user
    @user = User.find_by id: params[:id]
    unless @user == current_user
      flash[:danger] = t ".not_the_right_user"
      redirect_to root_url
    end
  end
end
