class ProfilesController < ApplicationController
  def edit
    @user = User.find(params[:id])
    @edit_profile = User.find(params[:id]).profile
  end
end
