class Chat < ApplicationRecord
  has_many :chat_members
  has_many :users, through: :chat_members
  has_many :messages, -> { order(created_at: :asc) }, dependent: :destroy
end
