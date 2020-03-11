class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :destroy, :show]
  def index
    @articles = Article.includes([user: :profile]).paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @new_article = Article.new
  end

  def create
    # @article = Article.new(article_params)
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path, notice: '記事を投稿しました'
    else
      redirect_to new_article_path
    end
  end

  def show
    @new_comment = Comment.new
    @comments = @article.comments.includes(:user)
  end

  def destroy
    if @article.destroy
      redirect_to articles_path, notice: '記事を削除しました'
    else
      render :show
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article.id), notice: '記事を更新しました'
    else
      render :edit
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :content).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
