class ChangeAdminsToAuthorities < ActiveRecord::Migration[5.2]
  def change
    rename_table :admins, :authorities
  end
end
