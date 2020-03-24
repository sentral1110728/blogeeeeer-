class AddColumnCategoryIdToArticles < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :category, foreign_key: true, after: :id
  end
end
