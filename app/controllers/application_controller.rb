class ApplicationController < ActionController::Base
  def check_log_in
    if !session[:user_id]
      redirect_to login_path, error: "You must to be logged in first"
    end
  end
end
