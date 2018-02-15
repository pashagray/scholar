class AddUnreadMessagesToUserInChat < ActiveRecord::Migration[5.1]
  def change
    add_column :user_in_chats, :unread_messages, :integer, null: false, default: 0
  end
end
