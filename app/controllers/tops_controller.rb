class TopsController < ApplicationController
  def index
    @categories = Category.all
    @categories_slice = @categories.each_slice(3).to_a
    puts @categories_slice.length
  end
end
