class Admin::UsersController < ApplicationController
  before_action :authenticate_user!, :authenticate_admin!

  def index
    @users = User.all
  end

  def destory
    user = User.find_by id: params[:id]
    if user.present?
      user.destroy
      redirect_to admin_users_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end


  def create
    user = User.new(users_new_params)
    if user.valid?
      user.save
      byebug
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(users_params)
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end

  def make_admin
    user = User.find_by id: params[:user_id]
    if user.present?
      user.admin = true
      user.save
      redirect_to admin_users_path
    end
  end

  def remove_admin
    user = User.find_by id: params[:user_id]
    if user.present?
      user.admin = false
      user.save
      redirect_to admin_users_path
    end
  end

  private
  def users_params
    params.require(:user).permit(:id, :name, :avatar)
  end

  def users_new_params
    params.require(:user).permit(:name, :email, :avatar, :password, :password_confirmation)
  end

  def authenticate_admin!
    redirect_to root_path unless current_user.admin?
  end
end
