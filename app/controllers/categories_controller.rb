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
end
