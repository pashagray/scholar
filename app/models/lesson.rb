class Lesson < ApplicationRecord
  DAYS_OF_THE_WEEK = %i(
    mon tue wed thu fri sat sun
  )

  belongs_to :journal_fraction

  delegate :journal, to: :journal_fraction

  validates :journal_fraction_id, :day, :starts_at, :ends_at, presence: true
end
