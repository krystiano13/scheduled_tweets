class PasswordResetController < ApplicationController
  def index

  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present?
      PasswordMailer.with(user: @user).reset.deliver_later
      redirect_to root_path, notice: "Email for password reset was sent"
    else
      flash[:error] = "Account with this email address does not exist"
      render :index
    end
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
  rescue
    redirect_to login_path, notice: "Token expired"
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to root_path, notice: "Password Updated !"
    else
      render :index
      return
    end
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end