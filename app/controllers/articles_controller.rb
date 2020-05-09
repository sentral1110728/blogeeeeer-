class ArticlesController < ApplicationController
  # 指定したアクションはログインしてないと利用できない(ログイン画面に遷移される)
  # before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_article, only: %i[edit update destroy show]
  before_action :set_categories, only: %i[new create search]
  # before_action :if_not_admin, only: %i[new,create,edit,update,destroy]

  def index
    @articles = Article.where('category_id LIKE(?)', params[:category_id].to_s)
                        .includes([user: :profile])
                        .paginate(page: params[:page], per_page: 5)
                        .order(created_at: :desc)
    @category = Category.find(params[:category_id])
  end

  def new
    # User.if_not_admin(current_user)
    if user_signed_in?
      redirect_to root_path, notice: '無効なURLです' unless current_user.authority_id == 2
    else
      redirect_to root_path, notice: '無効なURLです'
    end
    @new_article = Article.new
  end

  def create
    @new_article = Article.new(article_params)
    if @new_article.save
      redirect_to articles_path(category_id: @new_article.category_id), notice: '記事を投稿しました'
    else
      render :new
    end
  end

  def show
    @category = @article.category
    @new_comment = Comment.new
    @comments = @article.comments.includes([user: :profile]).paginate(page: params[:page], per_page: 10).order(created_at: :desc)
  end

  def destroy
    if @article.destroy
      redirect_to articles_path(category_id: @article.category_id), notice: '記事を削除しました'
    else
      render :show
    end
  end

  def edit
    if user_signed_in?
      redirect_to root_path, notice: '無効なURLです' unless current_user.authority_id == 2
    else
      redirect_to root_path, notice: '無効なURLです'
    end
  end

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
    params.require(:article)
          .permit(:title, :content)
          .merge(category_id: params[:article][:category_id], user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def set_categories
    @category_list = Category.all
  end

  # def if_not_admin
  #   if user_signed_in?
  #     redirect_to root_path, notice: '無効なURLです' unless current_user.authority_id == 2
  #   else
  #     redirect_to root_path, notice: '無効なURLです'
  #   end
  # end
end
