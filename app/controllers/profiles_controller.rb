class ProfilesController < ApplicationController
  #指定したアクションはログインしてないと利用できない(ログイン画面に遷移される)
  before_action :authenticate_user!, only: [:edit, :update]

  def edit
    @user = User.find(params[:user_id])
    @profile = User.find(params[:user_id]).profile
  end

  def update
    edited_profile = Profile.find(params[:id])
    ActiveRecord::Base.transaction do
      if edited_profile.update(profile_params)
        if edited_profile.user.update(nickname: params[:profile][:user][:nickname])
          redirect_to user_path(edited_profile.user_id), notice: 'プロフィールを更新しました'
        end
      end
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:appeal, :user_image)
  end

  def user_params
    params.require(:user).permit(:nickname)
  end
end
