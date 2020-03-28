class TopsController < ApplicationController
  def index
    @categories = Category.all
  end
end
