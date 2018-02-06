class Chat < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :messages, -> { order(created_at: :asc) }, dependent: :destroy

  def unread_count(user)
    messages.count - MessagesUser.where(chat_id: self.id, user_id: user.id).count
  end
end
