class Chat < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :messages, -> { order(created_at: :asc) }, dependent: :destroy

  def unread_count(user)
    sum = 0
    messages.where.not(user_id: user.id).each { |m| sum += 1 unless user.id.to_s.in?(m.read_by) }
    sum
  end
end
