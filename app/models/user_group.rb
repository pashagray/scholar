class UserGroup < ApplicationRecord
  SYSTEM_GROUPS = %w(school teachers_room)

  has_many :user_in_groups
  has_many :users, through: :user_in_groups

  has_many :adverts, as: :advertable

  validates :title, presence: true

  def self.school
    find_by_title('school')
  end

  def self.teachers_room
    find_by_title('teachers_room')
  end

  def system_group?
    SYSTEM_GROUPS.include?(title)
  end

  def subscribers
    users
  end

  def full_title
    system_group? ? I18n.t("user_groups.#{title}") : title
  end

  def users_count
    users.count
  end
end
