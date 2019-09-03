class UsersController < ApplicationController
  before_action :logged_in, only: [:edit, :update]
  before_action :load_user, only: [:show, :edit, :update]
  before_action :valid_user, only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def show;  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      redirect_to @user, success: "Register successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update user_params
      redirect_to @user, success: "Update profile successfully!"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation, :phone, :address, :picture)
  end

  def load_user
    @user = User.find_by(id: params[:id])
    redirect_to root_path, warning: "User is not exist!" unless @user
  end

  def valid_user
    redirect_to root_path, warning: "User invalid" unless current_user?(@user)
  end
end
