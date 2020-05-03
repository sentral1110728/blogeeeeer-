class CategoriesController < ApplicationController
  before_action :set_category, only: %i[edit update destroy]

  def index
    # TODO: SQLでまとめたい
    @categories = Category.all
    @category_likes_count =
      Category
      .joins(articles: :likes)
      .group('categories.id')
      .count
    @category_comments_count =
      Category
      .joins(articles: :comments)
      .group('categories.id')
      .count
    unless params[:image].nil?
      img = MiniMagick::Image.read(params[:image])
      img.resize '300x300'
    end
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
end
