class JournalFraction < ApplicationRecord
  FRACTIONS = %w(first_quarter second_quarter third_quarter fourth_quarter first_half_year second_half_year)
  QUARTERS = %w(first_quarter second_quarter third_quarter fourth_quarter)

  belongs_to :journal
  has_many :lessons

  validates :title, :starts_on, :ends_on, :journal_id, presence: true
  validates :title, inclusion: { in: FRACTIONS }
  validates :title, uniqueness: { scope: :journal_id }

  scope :first_quarter,  -> { where(title: ['first_quarter', 'first_half_year']) }
  scope :second_quarter, -> { where(title: ['second_quarter', 'first_half_year']) }
  scope :third_quarter,  -> { where(title: ['third_quarter', 'second_half_year']) }
  scope :fourth_quarter, -> { where(title: ['third_quarter', 'second_half_year']) }

  delegate :subject, to: :journal
end
