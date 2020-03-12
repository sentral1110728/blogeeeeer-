class LikesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @like = current_user.likes.create(article_id: params[:article_id])
    @articles = Article.all
  end

  def destroy
    @article = Article.find(params[:article_id])
    like = current_user.likes.find_by(article_id: params[:article_id])
    like.destroy
    @articles = Article.all
  end
end
