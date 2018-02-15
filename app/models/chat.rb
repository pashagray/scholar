class Chat < ApplicationRecord

  has_many :user_in_chats, dependent: :destroy
  has_many :users, through: :user_in_chats
  has_many :messages, dependent: :destroy

  scope :order_by_relevance, -> { includes(:messages).order('messages.created_at DESC') }

  scope :dialogs, -> { where(kind: "dialog") }
  scope :groups,  -> { where(kind: "group") }

  def self.find_dialog(u1, u2)
    u1_chats = u1.chats.pluck(:id)
    u2_chats = u2.chats.pluck(:id)
    dialogs.where(id: u1_chats & u2_chats).last
  end

  def title(viewer)
    return self[:title] unless self[:title].blank?
    (users - [viewer]).map(&:full_name).join(', ')
  end
end
