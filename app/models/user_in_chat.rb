class UserInChat < ApplicationRecord
  belongs_to :user
  belongs_to :chat

  def add_unread_message
    update(unread_messages: unread_messages + 1)
  end

  def reset_unread_messages
    update(unread_messages: 0)
  end
end
