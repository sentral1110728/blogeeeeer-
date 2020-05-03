class ArticlesController < ApplicationController
  # 指定したアクションはログインしてないと利用できない(ログイン画面に遷移される)
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_article, only: %i[edit update destroy show]
  before_action :set_categories, only: %i[new create search]

  def index
    @articles = Article.where('category_id LIKE(?)', params[:category_id].to_s).includes([user: :profile]).paginate(page: params[:page], per_page: 10).order(created_at: :desc)
    @category = Category.find(params[:category_id])
  end

  def new
    if current_user.authority_id == 1
      redirect_to tops_path, notice: '管理者用機能のため遷移できません。'
    end
    @new_article = Article.new
  end

  def create
    @new_article = Article.new(article_params)
    if @new_article.save
      redirect_to tops_path, notice: '記事を投稿しました'
    else
      render :new
    end
  end

  def show
    @new_comment = Comment.new
    @comments = @article.comments.includes([user: :profile]).order(created_at: :desc)
  end

  def destroy
    if @article.destroy
      redirect_to articles_path, notice: '記事を削除しました'
    else
      render :show
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article.id), notice: '記事を更新しました'
    else
      render :edit
    end
  end

  def search
    @articles = Article.search_articles(params[:category_id], params[:keyword], params[:page], 5)
  end

  private

  def article_params
    params.require(:article).permit(:title, :content).merge(category_id: params[:article][:category_id], user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def set_categories
    @category_list = Category.all
  end
end
