class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    redirect_to article_path(@comment.article), notice: 'コメントを送信しました。'
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment).merge(article_id: params[:article_id],user_id: current_user.id)
  end
end
