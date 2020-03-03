class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def new
    @new_article = Article.new
  end

  def create
    @article = Article.create(article_params)
    redirect_to articles_path
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def edit
    @edit_article = Article.find(params[:id])
  end

  def update
    edited_article = Article.find(params[:id])
    edited_article.update(article_params)
    redirect_to article_path(edited_article.id)
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
