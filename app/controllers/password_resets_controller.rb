class PasswordResetsController < ApplicationController
  before_action :get_user, :valid_user, :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by email: params[:password_reset][:email].downcase
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      redirect_to root_path, info: "Email sent with password reset instructions"
    else
      flash.now[:danger] = "Email address not found"
      render :new
    end
  end

  def edit
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, "can't be empty")
      render :edit
    elsif @user.update_attributes(user_params)
      log_in @user
      @user.update_attribute(:reset_digest, nil)
      redirect_to root_path, success: "Password has been reset."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def get_user
    @user = User.find_by email: params[:email]
  end

  def valid_user
    return if @user && @user.authenticated?(:reset, params[:id])
    redirect_to root_path
  end

  def check_expiration
    if @user.password_reset_expired?
      redirect_to new_password_reset_path, danger: "Password reset has expired."
    end
  end
end
