class Lesson < ApplicationRecord
  DAYS_OF_THE_WEEK = %i(
    mon tue wed thu fri sat sun
  )

  belongs_to :journal_fraction

  delegate :journal, to: :journal_fraction

  validates :journal_fraction_id, :day, :starts_at, :ends_at, presence: true

  scope :for_week, -> (year, week) { where(day: Date.commercial(year, week)..(Date.commercial(year, week + 1) - 1.day)) }

  def subject
    journal.subject
  end

  def teacher
    journal.teacher
  end

  def editable?
    starts_at < Time.now.utc
  end
end
