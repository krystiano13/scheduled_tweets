class SessionController < ApplicationController
  def index
    @user = User.new
  end

  def create

  end
  def delete
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged Out"
  end
end