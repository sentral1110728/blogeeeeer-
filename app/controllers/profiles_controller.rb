class ProfilesController < ApplicationController
  def edit
    @user = User.find(params[:user_id])
    @profile = User.find(params[:user_id]).profile
  end

  def update
    edited_profile = Profile.find(params[:id])
    edited_profile.update(profile_params)
    redirect_to user_path(edited_profile.user_id)
  end

  private
  def profile_params
    params.require(:profile).permit(:appeal, :user_image)
  end
end
