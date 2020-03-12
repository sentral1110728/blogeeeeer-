class LikesController < ApplicationController
  before_action :set_params, only: [:create, :destroy]
  def create
    # @receiving_user = User.find(params[:user_id])
    # @sending_user = User.find(current_user.id)
    # @article = Article.find(params[:article_id])
    # @user_like = Like.where(user_id: current_user.id, article_id: @article)
    if @user_like.length == 0 then
      @like = current_user.likes.create(article_id: params[:article_id])
    end
    @articles = Article.includes([user: :profile]).paginate(page: params[:page], per_page: 5)
    @article_like_count = Article.find(params[:article_id]).likes
  end

  def destroy
    # @article = Article.find(params[:article_id])
    # @sending_user = User.find(current_user.id)
    # @user_like = Like.where(user_id: current_user.id, article_id: @article)
    like = current_user.likes.find_by(article_id: params[:article_id])
    if @user_like.length == 1 then
      like.destroy
    end
    @articles = Article.includes([user: :profile]).paginate(page: params[:page], per_page: 5)
    @article_like_count = Article.find(params[:article_id]).likes
  end

  private
  def set_params
    @article = Article.find(params[:article_id])
    @sending_user = User.find(current_user.id)
    @user_like = Like.where(user_id: current_user.id, article_id: @article)
  end
end
