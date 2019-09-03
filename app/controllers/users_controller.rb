class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    redirect_to root_path, warning: "The page does not exist!" unless @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      redirect_to root_path, success: "Register successfully!"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation, :phone, :address, :picture)
  end
end
