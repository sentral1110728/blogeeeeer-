class ChangeColmnAuthFlagToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :authority, foreign_key: true, after: :id, default: 1, null: false
  end
end
