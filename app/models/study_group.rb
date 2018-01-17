class StudyGroup < ApplicationRecord

  mount_uploader :avatar, AvatarUploader

  has_many :study_group_students
  has_many :students, through: :study_group_students, source: :user

  has_many :study_group_supervisors
  has_many :supervisors, through: :study_group_supervisors, source: :user

  has_many :study_sub_groups

  has_many :adverts, as: :advertable

  validates :title, uniqueness: { scope: :level }

  scope :order_by_model, -> { StudyGroup.order_by_classic_model }
  scope :order_by_classic_model, -> { order('level::int', :title) }

  def full_title
    "#{level} #{title}"
  end

  def students_count
    students.count
  end
end
