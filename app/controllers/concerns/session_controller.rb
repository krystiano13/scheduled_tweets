class SessionController < ApplicationController
  def delete
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged Out"
  end
end