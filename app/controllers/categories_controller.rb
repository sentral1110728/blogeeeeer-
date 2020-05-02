class CategoriesController < ApplicationController
  def index
    # TODO SQLでまとめたい
    @categories = Category.all
    @category_likes_count =
      Category
        .joins(articles: :likes)
        .group("categories.id")
        .count
    @category_comments_count =
      Category
        .joins(articles: :comments)
        .group("categories.id")
        .count
    if params[:image] != nil
      img = MiniMagick::Image.read(params[:image])
      img.resize "300x300"
    end
  end

  def new
    @new_category = Category.new
  end

  def create
    create_category = Category.new(category_params)
    if create_category.save
      redirect_to categories_path, notice: '新規カテゴリーを作成しました'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_path, notice: '記事を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
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
end
