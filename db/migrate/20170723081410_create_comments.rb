class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :message
      t.integer :user_id
      t.integer :tip_id
      t.timestamps
    end

    add_index :comments, [:user_id, :tip_id]
    add_index :comments, :tip_id
  end
end
