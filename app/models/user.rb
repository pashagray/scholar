class User < ApplicationRecord

  GENDERS = %w(male female).freeze

  include Delegatable

  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # Notification system
  acts_as_target

  validates :iin, :last_name, :first_name, presence: true

  has_one :student_profile
  has_one :teacher_profile
  has_one :custodian_profile
  has_one :admin_profile

  has_one :study_group_student
  has_one :study_group, through: :study_group_student

  has_many :study_group_supervisors
  has_many :supervising_study_groups, through: :study_group_supervisors, source: :study_group

  has_many :study_sub_group_students
  has_many :study_sub_groups, through: :study_sub_group_students, source: :study_sub_group

  has_many :adverts, as: :author
  has_many :attachments, as: :attachmentable

  has_many :user_in_groups
  has_many :user_groups, through: :user_in_groups

  has_many :user_in_chats
  has_many :chats, through: :user_in_chats

  scope :students,   -> { joins(:student_profile) }
  scope :teachers,   -> { joins(:teacher_profile) }
  scope :custodians, -> { joins(:custodian_profile) }
  scope :admins,     -> { joins(:admin_profile) }

  scope :with_temp_password, -> { where(id: all.map { |u| u.id if u.is_password_change_required? }.compact) }

  scope :students_without_study_group, -> { 
    students
    .joins('LEFT OUTER JOIN study_group_students ON (users.id = study_group_students.user_id)')
    .where('study_group_students.user_id IS NULL') 
  }

  scope :alphabetical_order, -> { order(:last_name, :first_name, :middle_name) }

  scope :not_chating_with, -> (user) do
    chats_ids = user.chats.dialogs.pluck(:id)
    user_in_chats_ids = UserInChat.where(chat_id: chats_ids).pluck(:user_id)
    users = User.where.not(id: user_in_chats_ids)
  end

  def student?
    !!student_profile
  end

  def teacher?
    !!teacher_profile
  end

  def custodian?
    !!custodian_profile
  end

  def admin?
    !!admin_profile
  end

  def roles
    %i(student teacher custodian admin)
    .map { |i| i if send("#{i}?".to_sym) }.compact
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def is_password_change_required?
    valid_password?(temp_password)
  end

  def full_name
    "#{last_name} #{first_name} #{middle_name}".rstrip
  end

  def short_name
    "#{last_name} #{first_name[0]} #{middle_name ? middle_name[0] : ''}".rstrip
  end

  def printable_notifier_name
    full_name
  end
end
