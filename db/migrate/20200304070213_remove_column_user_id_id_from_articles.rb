class RemoveColumnUserIdIdFromArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :user_id_id, :integer
  end
end
