class CommentsController < ApplicationController
  #指定したアクションはログインしてないと利用できない(ログイン画面に遷移される)
  before_action :authenticate_user!, only: [:create]
  def create
    @article = Article.find(params[:article_id])
    @comments = @article.comments.includes(:user).order(created_at: :desc)
    @comment = Comment.create(comment_params)
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment).merge(article_id: params[:article_id],user_id: current_user.id)
  end
end
