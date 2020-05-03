class ChangeColumnToLikes < ActiveRecord::Migration[5.2]
  def change
    change_column_null :likes, :article_id, false, 6
    change_column_null :likes, :user_id, false, 8
  end
end
