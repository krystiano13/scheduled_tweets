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
end