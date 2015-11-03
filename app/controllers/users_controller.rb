class UsersController < ApplicationController
  skip_before_filter :authenticate, only: [:new, :create]
  before_filter :check_user

  def new
    @user = User.new
  end

  def create
    user = User.new(params_user)
    if user.save
      redirect_to root_path, notice: "User saved"
    else
      render :new
    end
  end

  private

  def params_user
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
