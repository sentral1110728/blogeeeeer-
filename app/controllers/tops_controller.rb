class TopsController < ApplicationController
  def index
    @categories = Category.all
    @categories_slice = @categories.each_slice(3).to_a
    @like_article_ranking = Article.find(Like.group(:article_id).order('count(article_id) desc').limit(5).pluck(:article_id))
  end
end
