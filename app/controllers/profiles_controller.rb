class ProfilesController < ApplicationController
  # 指定したアクションはログインしてないと利用できない(ログイン画面に遷移される)
  before_action :authenticate_user!, only: %i[edit update]

  def edit
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end

  def update
    edited_profile = Profile.find(params[:id])
    begin
      ActiveRecord::Base.transaction do
        edited_profile.update(profile_params)
        edited_profile.user.update(nickname: params[:profile][:user][:nickname])
      end
    rescue Exception => e
      puts e
      flash[:notice] = '失敗しました。リトライしてみてください'
      render 'edit'
    end
    redirect_to user_profile_path(edited_profile.user_id, edited_profile.id), notice: 'プロフィールを更新しました'
  end

  def show
    @user = User.find(params[:user_id])
    @user_profile = @user.profile
  end

  private

  def profile_params
    params.require(:profile).permit(:appeal, :user_image).merge(user_id: current_user.id)
  end

  def user_params
    params.require(:user).permit(:nickname)
  end
end
