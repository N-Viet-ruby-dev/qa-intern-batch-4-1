class ApplicationController < ActionController::Base
  add_flash_types :success, :danger, :warning, :info

  include SessionsHelper

  def logged_in
    return if logged_in?
    store_location
    redirect_to login_path, info: "Please login"
  end
end
