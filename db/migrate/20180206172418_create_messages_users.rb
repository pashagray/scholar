class CreateMessagesUsers < ActiveRecord::Migration[5.1]
  # this is about read messages by user
  def up
    create_table :messages_users do |t|
      t.belongs_to :user
      t.belongs_to :message
      t.integer :chat_id
      t.timestamps
    end
  end

  def down
    drop_table :messages_users
  end
end
