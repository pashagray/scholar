class Chat < ApplicationRecord
  has_many :chat_members
  has_and_belongs_to_many :users
  has_many :messages, -> { order(created_at: :asc) }, dependent: :destroy
end
