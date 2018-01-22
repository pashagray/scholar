class AcademicPeriod < ApplicationRecord
  validates :title, format: /\A2[0-9]{3}\/2[0-9]{3}\z/

  has_many :academic_fractions, dependent: :restrict_with_error

  def valid_quarters?
    academic_fractions.where(title: [1, 2, 3, 4]).uniq.count == 4
  end

  def first_quarter
    fraction = academic_fractions.find_by_title('1')
    fraction.starts_on..fraction.ends_on
  end

  def second_quarter
    fraction = academic_fractions.find_by_title('2')
    fraction.starts_on..fraction.ends_on
  end

  def third_quarter
    fraction = academic_fractions.find_by_title('3')
    fraction.starts_on..fraction.ends_on
  end

  def fourth_quarter
    fraction = academic_fractions.find_by_title('4')
    fraction.starts_on..fraction.ends_on
  end

  def first_half_year
    (first_quarter.first)..(second_quarter.last)
  end

  def second_half_year
    (third_quarter.first)..(fourth_quarter.last)
  end

  def year
    (first_quarter.first)..(fourth_quarter.last)
  end
end
