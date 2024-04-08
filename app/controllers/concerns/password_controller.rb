class PasswordController < ApplicationController
  before_action :check_log_in
  def index

  end

  def update
    if Current.user.update(password_params)
      redirect_to root_path, notice: "Password Updated !"
    else
      render :index
      return
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end