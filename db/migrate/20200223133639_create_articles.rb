class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string   :title, null: false, index: true
      t.text     :content, null: false
      t.timestamps null: true
    end
  end
end
