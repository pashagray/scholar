class AcademicFraction < ApplicationRecord
  validates :title, :starts_on, :ends_on, presence: true

  belongs_to :academic_period
end
