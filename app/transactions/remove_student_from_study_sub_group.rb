class RemoveStudentFromStudySubGroup
  include Dry::Transaction

  step :find
  step :check_role
  step :destroy

  def find(input)
    student = User.find_by_id(input[:student_id])
    study_sub_group = StudySubGroup.find_by_id(input[:study_sub_group_id])
    if student && study_sub_group
      Right({ student: student, study_sub_group: study_sub_group})
    else
      Left(:record_not_found)
    end
  end

  def check_role(input)
    sgs = StudySubGroupStudent.find_by(
      user: input[:student], study_sub_group: input[:study_sub_group]
    )
    if sgs
      input[:model] = sgs
      Right(input)
    else
      Left(:student_is_not_in_this_study_sub_group)
    end
  end

  def destroy(input)
    if input[:model].destroy
      Right(true)
    else
      Left(:student_is_not_removable_from_study_sub_group)
    end
  end
end
