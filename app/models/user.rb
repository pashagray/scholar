class User < ApplicationRecord

  GENDERS = %w(male female).freeze

  include Delegatable

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  validates :iin, :last_name, :first_name, presence: true

  has_one :student_profile
  has_one :teacher_profile
  has_one :custodian_profile
  has_one :admin_profile

  scope :students,   -> { joins(:student_profile) }
  scope :teachers,   -> { joins(:teacher_profile) }
  scope :custodians, -> { joins(:custodian_profile) }
  scope :admins,     -> { joins(:admin_profile) }

  def admin?
    !!admin_profile
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
end
