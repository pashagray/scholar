class Journal < ApplicationRecord

  include Delegatable

  belongs_to :subject
  belongs_to :teacher, class_name: 'User', foreign_key: 'teacher_id'
  belongs_to :journable, polymorphic: true
  belongs_to :academic_period

  has_many :journal_fractions
  has_many :lessons, through: :journal_fractions

  validates :subject_id, :teacher_id, :journable_type, :journable_id,
            :academic_period_id, :grading_system,
            :fraction_grading_formula, :period_grading_formula,  presence: true
  validates :subject_id, uniqueness: { scope: [:journable_type, :journable_id] }

  scope :for_study_group, -> (sg_id) do 
    where(journable_type: 'StudyGroup', journable_id: sg_id)
    .or(where(journable_type: 'StudySubGroup', journable_id: StudySubGroup.where(study_group_id: sg_id).pluck(:id)))
  end

  scope :order_by_default, -> { joins(:academic_period).order('academic_periods.title ASC') }

  delegate :title, to: :subject
end
