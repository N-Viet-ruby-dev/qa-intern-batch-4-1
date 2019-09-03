class ApplicationController < ActionController::Base
  add_flash_types :success, :danger, :warning, :info

  include SessionsHelper

  def logged_in
    redirect_to login_path, info: "Please login" unless logged_in?
  end
end
