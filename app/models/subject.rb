class Subject < ApplicationRecord
  validates :title, uniqueness: true

  scope :alphabetical_order, -> { order(:title) }
end
