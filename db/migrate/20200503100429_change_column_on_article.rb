class ChangeColumnOnArticle < ActiveRecord::Migration[5.2]
  def change
    change_column_null :articles, :category_id, false, 6
    change_column_null :articles, :user_id, false, 8
  end
end
