class RemoveStudentFromStudyGroup
  include Dry::Transaction

  step :find
  step :check_role
  # step :check_praepostor
  step :check_sub_groups
  step :destroy

  def find(input)
    student = User.find_by_id(input[:student_id])
    study_group = StudyGroup.find_by_id(input[:study_group_id])
    if student && study_group
      Right({ student: student, study_group: study_group})
    else
      Left(:record_not_found)
    end
  end

  def check_role(input)
    sgs = StudyGroupStudent.find_by(
      user: input[:student], study_group: input[:study_group]
    )
    if sgs
      input[:model] = sgs
      Right(input)
    else
      Left(:student_is_not_in_this_study_group)
    end
  end

  def check_sub_groups(input)
    unless input[:student].study_sub_groups.any?
      Right(input)
    else
      Left(:student_belongs_to_study_sub_groups)
    end
  end

  def destroy(input)
    if input[:model].destroy
      Right(true)
    else
      Left(:student_is_not_removable_from_study_group)
    end
  end

  # def check_praepostor(input)
  #   sgp = StudyGroupPraepostor.find_by(
  #     user: input[:student], study_group: input[:study_group]
  #   )
  #   unless sgp
  #     Right(model: input[:model])
  #   else
  #     Left({ errors: { process: :student_is_praepostor_of_study_group } })
  #   end
  # end
end
