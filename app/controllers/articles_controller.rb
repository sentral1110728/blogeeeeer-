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
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
