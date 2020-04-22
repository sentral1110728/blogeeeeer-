class RemoveAdminFlagToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :auth_flag, :integer
  end
end
