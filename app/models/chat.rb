class Chat < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :messages, -> { order(created_at: :asc) }, dependent: :destroy
  scope :by_messages, -> { joins(:messages).order('messages.created_at DESC').uniq }
  scope :without_messages, -> { where('chats.id NOT IN (SELECT DISTINCT(messages.chat_id) FROM messages)') }

  def unread_count(user)
    messages.count - user.read_messages.where(chat_id: id).count
  end
end
