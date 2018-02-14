class CreateUsersChatsJoinTable < ActiveRecord::Migration[5.1]
  def up
    create_join_table :chats, :users
  end

  def down
    drop_join_table :chats, :users
  end
end
