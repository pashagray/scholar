class Chat < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :messages, -> { order(created_at: :asc) }, dependent: :destroy
end
