class ArticlesController < ApplicationController
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
    @article = Article.find(params[:id])
    @new_comment = Comment.new
    @comments = @article.comments.includes(:user)
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to articles_path, notice: '記事を削除しました'
    else
      render :show
    end
  end

  def edit
    @edit_article = Article.find(params[:id])
  end

  def update
    edited_article = Article.find(params[:id])
    
    if edited_article.update(article_params)
      redirect_to article_path(edited_article.id), notice: '記事を更新しました'
    else
      render :edit
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :content).merge(user_id: current_user.id)
  end
end
