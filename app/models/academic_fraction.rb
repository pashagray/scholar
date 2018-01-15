class AcademicFraction < ApplicationRecord
  validates :title, :starts_on, :ends_on, presence: true
  validates :title, format: /\A[1-4]\z/

  belongs_to :academic_period
end
