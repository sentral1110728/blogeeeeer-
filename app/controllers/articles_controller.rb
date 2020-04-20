class ArticlesController < ApplicationController
  #指定したアクションはログインしてないと利用できない(ログイン画面に遷移される)
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_article, only: [:edit, :update, :destroy, :show]
  
  def index
    @articles = Article.where("category_id LIKE(?)", "#{params[:category_id]}").includes([user: :profile]).paginate(page: params[:page], per_page: 10).order(created_at: :desc)
    @category = Category.find(params[:category_id])
  end
  
  def new
    @new_article = Article.new
    @category_list = Category.all
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path, notice: '記事を投稿しました'
    else
      redirect_to new_article_path
    end
  end

  def show
    @new_comment = Comment.new
    @comments = @article.comments.includes([user: :profile]).order(created_at: :desc)
    # @comment_user = @comments.user.profile
    # @user = User.find(params[:user_id])
    # @user_profile = @user.profile
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


  def search
    if params[:category_id] == nil || params[:category_id] == "" then
      @articles = Article.where('title LIKE(?)', "%#{params[:keyword]}%")
                         .includes([user: :profile])
                         .paginate(page: params[:page], per_page: 5)
    else
      @articles = Article.where('category_id LIKE(?) and title LIKE(?)', "#{params[:category_id]}", "%#{params[:keyword]}%")
                         .includes([user: :profile])
                         .paginate(page: params[:page], per_page: 5)
    end
    unless @articles.exists?
      redirect_to search_articles_path, notice: '検索結果は0件です'
    end
    @category_list = Category.all
  end

  private
  def article_params
    params.require(:article).permit(:title, :content).merge(category_id: params[:article][:category_id], user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
