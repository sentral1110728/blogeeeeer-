class AddColumnImageToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :image, :string, after: :category_name
  end
end
