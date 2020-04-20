class AddColmnAuthFlagToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :auth_flag, :integer, null: false, after: :id, default: 1
  end

  def down
    remove_column :users, :auth_flag, :integer
  end
end
