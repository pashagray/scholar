class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :check_password!

  def check_password!
    redirect_to my_change_password_path if current_user && current_user.is_password_change_required?
  end
end
