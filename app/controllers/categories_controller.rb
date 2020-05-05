class CategoriesController < ApplicationController
  before_action :set_category, only: %i[edit update destroy]
  before_action :if_not_admin

  def index
    # TODO: SQLでまとめたい
    @categories = Category.all
    @category_likes_count = Category.joins(articles: :likes)
                                    .group('categories.id')
                                    .count
    @category_comments_count = Category.joins(articles: :comments)
                                        .group('categories.id')
                                        .count
    category_image = Category.category_image(params[:image])
  end

  def new
    @new_category = Category.new
  end

  def create
    @new_category = Category.new(category_params)
    if @new_category.save
      redirect_to categories_path, notice: '新規カテゴリーを作成しました'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: '記事を更新しました'
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      redirect_to categories_path, notice: '記事を削除しました'
    else
      render :index
    end
  end

  private
  def category_params
    params.require(:category).permit(:category_name, :image)
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def if_not_admin
    if user_signed_in?
      redirect_to root_path, notice: '無効なURLです' unless current_user.authority_id == 2
    else
      redirect_to root_path, notice: '無効なURLです'
    end
  end
end
