class ChangeColumnNameToAuthorities < ActiveRecord::Migration[5.2]
  def change
    change_column_null :authorities, :name, false
  end
end
