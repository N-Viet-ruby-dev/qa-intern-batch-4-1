class SessionsController < ApplicationController
  def new
    redirect_to root_path if logged_in?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      redirect_to root_path, success: "Login Successfully"
    else
      flash.now[:danger] = "Email/Password invalid"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path, success: "Logout Successfully"
  end
end
