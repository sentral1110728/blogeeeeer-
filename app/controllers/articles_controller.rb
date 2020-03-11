class ArticlesController < ApplicationController
  #指定したアクションはログインしてないと利用できない(ログイン画面に遷移される)
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @articles = Article.includes([user: :profile]).paginate(page: params[:page], per_page: 5)
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
    @new_comment = Comment.new
    @comments = @article.comments.includes(:user)
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
    params.require(:article).permit(:title, :content).merge(user_id: current_user.id)
  end
end
