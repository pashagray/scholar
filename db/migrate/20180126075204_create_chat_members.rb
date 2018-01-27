class CreateChatMembers < ActiveRecord::Migration[5.1]
  def up
    create_table :chat_members do |t|
      t.belongs_to :user, index: true
      t.belongs_to :chat, index: true
    end
  end

  def down
    drop_table :chat_members
  end
end
