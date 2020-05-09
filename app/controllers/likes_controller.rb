class LikesController < ApplicationController
  before_action :set_params, only: %i[create destroy]

  def create
    if @user_like.empty?
      @like = current_user.likes.create(article_id: params[:article_id])
      render 'index.js.erb'
    end
  end

  def destroy
    if @user_like.length == 1
      like = current_user.likes.find_by(article_id: params[:article_id])
      like.destroy
      render 'index.js.erb'
    end
  end

  private

  def set_params
    @article = Article.find(params[:article_id])
    @sending_user = User.find(current_user.id)
    @user_like = Like.where(user_id: current_user.id, article_id: @article)
    @category = Category.find(params[:category_id])
    @article_like_count = Article.find(params[:article_id]).likes
    @articles = Article.where('category_id LIKE(?)', params[:category_id].to_s)
                       .includes([user: :profile])
                       .paginate(page: params[:page], per_page: 5)
                       .order(created_at: :desc)
  end
end
