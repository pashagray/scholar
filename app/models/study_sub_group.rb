class StudySubGroup < ApplicationRecord

  include Delegatable

  validates :title, uniqueness: { scope: :study_group_id }
  belongs_to :study_group

  has_many :study_sub_group_students
  has_many :students, through: :study_sub_group_students, source: :user

  has_many :journals, as: :journable

  def full_title
    title
  end
end
