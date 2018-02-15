class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user
  has_many :user_in_chats, through: :chat

  after_commit -> do
    ChatMessageWorker.perform_async(id)
  end
  after_save -> { user_in_chats.where.not(user_id: user_id).each(&:add_unread_message) }

end
