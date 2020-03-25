class ArticlesController < ApplicationController
  #指定したアクションはログインしてないと利用できない(ログイン画面に遷移される)
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_article, only: [:edit, :update, :destroy, :show]
  
  def index
    # TODO 動的に配列作成する
    @article_array = []
    @articles = Article.includes([user: :profile]).paginate(page: params[:newArriva_page], per_page: 5).order(created_at: :desc)
    @article_array << @articles
    @articles1 = Article.where("category_id LIKE(?)", "1").includes([user: :profile]).paginate(page: params[:article1_page], per_page: 5).order(created_at: :desc)
    @article_array << @articles1
    @articles2 = Article.where("category_id LIKE(?)", "2").includes([user: :profile]).paginate(page: params[:aritcle2_page], per_page: 5).order(created_at: :desc)
    @article_array << @articles2
    @articles3 = Article.where("category_id LIKE(?)", "3").includes([user: :profile]).paginate(page: params[:aritcle3_page], per_page: 5).order(created_at: :desc)
    @article_array << @articles3
    @category_list = Category.all
  end
  
  def new
    @new_article = Article.new
    @category_list = Category.all
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


  def search
    @articles = Article.where('title LIKE(?)', "%#{params[:keyword]}%").includes([user: :profile]).paginate(page: params[:page], per_page: 5)
    render :index
  end

  private
  def article_params
    params.require(:article).permit(:title, :content).merge(category_id: params[:article][:category_id], user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
