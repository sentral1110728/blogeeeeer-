class CommentsController < ApplicationController
  #指定したアクションはログインしてないと利用できない(ログイン画面に遷移される)
  before_action :authenticate_user!, only: [:create]
  def create
    @comment = Comment.create(comment_params)
    redirect_to article_path(@comment.article), notice: 'コメントを送信しました。'
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment).merge(article_id: params[:article_id],user_id: current_user.id)
  end
end
