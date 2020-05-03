class ChangeColumnOnCategory < ActiveRecord::Migration[5.2]
  def change
    change_column_null :categories, :image, false, 'images.jpeg'
  end
end
