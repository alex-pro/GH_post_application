class SessionsController < ApplicationController
  skip_before_filter :authenticate, only: [:new, :create]
  before_filter :check_user, except: :destroy

  def create
    user = User.find_by(email: params[:sessions][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      session[:banner] = 0
      flash[:notice] = "You loged in as #{current_user.email}"
      redirect_to root_path
    else
      flash.now[:danger] = 'Incorrect password or email'
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to new_session_path
  end
end
