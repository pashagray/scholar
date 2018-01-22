class Subject < ApplicationRecord
  validates :title, uniqueness: true

  has_many :journals

  scope :alphabetical_order, -> { order(:title) }
end
