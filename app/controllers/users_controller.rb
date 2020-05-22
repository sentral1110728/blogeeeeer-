class UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page], per_page: 10)
    @authorities = Authority.all
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to users_path, notice: "変更完了"
    else
      redirect_to users_path, notice: "変更できませんでした。"
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email).merge(authority_id: params[:user][:authority_id])
  end
end
