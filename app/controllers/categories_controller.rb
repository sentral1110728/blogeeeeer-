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
  end

  def update
  end

  private
  def category_params
    params.require(:category).permit(:category_name, :image)
  end
end
