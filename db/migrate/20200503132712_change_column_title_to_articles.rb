class ChangeColumnTitleToArticles < ActiveRecord::Migration[5.2]
  def change
    change_column :articles, :title, :string, index: true
  end
end
