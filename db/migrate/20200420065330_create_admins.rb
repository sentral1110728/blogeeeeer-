class CreateAdmins < ActiveRecord::Migration[5.2]
  def up
    create_table :admins do |t|
      t.string :name
    end
  end
  
  def down
    drop_table :users
  end
end
