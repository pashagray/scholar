class CreateUserInChats < ActiveRecord::Migration[5.1]
  def change
    create_table :user_in_chats do |t|
      t.integer :chat_id, null: false
      t.integer :user_id, null: false
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :user_in_chats, :chat_id
    add_index :user_in_chats, :user_id
    add_index :user_in_chats, :active
    add_index :user_in_chats, [:chat_id, :user_id]
    add_index :user_in_chats, [:chat_id, :user_id, :active]
  end
end
