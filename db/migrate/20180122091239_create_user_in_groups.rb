class CreateUserInGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :user_in_groups do |t|
      t.integer :user_id
      t.integer :user_group_id

      t.timestamps
    end
    add_index :user_in_groups, :user_id
    add_index :user_in_groups, :user_group_id
    add_index :user_in_groups, [:user_id, :user_group_id], unique: true
  end
end
