class ProfilesController < ApplicationController
  def index
    @users = User.all - [current_user]
  end

  def show
    user = User.find(params[:id])
    @profile = user.profile
  end

  def edit
    user = User.find(params[:id])
    @profile = user.profile
  end

  def update
    user = User.find(params[:id])
    @profile = user.profile

    if @profile.update(profile_params)
      redirect_to profile_path
      flash[:notice] = 'Your profile successfully updated.'
    else
      render :edit
      flash[:error] = 'Something wrong'
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :country, :birthday, :sex, :about, :avatar)
  end
end
