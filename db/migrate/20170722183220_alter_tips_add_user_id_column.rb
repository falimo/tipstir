class AlterTipsAddUserIdColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :tips, :user_id, :integer
    add_index :tips, :user_id
  end
end
