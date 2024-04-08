class ApplicationController < ActionController::Base
  before_action :set_current_user
  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def require_log_in
    if !session[:user_id]
      redirect_to login_path, error: "You must to be logged in first"
    end
  end
end