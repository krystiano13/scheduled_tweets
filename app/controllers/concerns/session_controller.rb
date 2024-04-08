class SessionController < ApplicationController
  def index
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:email])
    puts "User found:"
    puts params[:email]
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged In"
    else
      flash[:error] = "Wrong Credentials"
      render :index
    end
  end
  def delete
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged Out"
  end
end