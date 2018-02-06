class Message < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader
  has_many :messages_users, dependent: :destroy
  has_many :readers, through: :messages_users, source: :user
  belongs_to :chat

  def author
    User.find(self.author_id)
  end
end
