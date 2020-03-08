class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @user_profile = User.find(params[:id])
    @user_profile = @user.profile
  end
end
