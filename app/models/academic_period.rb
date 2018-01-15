class AcademicPeriod < ApplicationRecord
  validates :title, format: /\A2[0-9]{3}\/2[0-9]{3}\z/

  has_many :academic_fractions, dependent: :restrict_with_error
end
