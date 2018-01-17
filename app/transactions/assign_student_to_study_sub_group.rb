class AssignStudentToStudySubGroup
  include Dry::Transaction

  step :find
  step :check_role
  step :check_study_group
  step :persist

  def find(input)
    user = User.find_by_id(input[:student_id])
    study_sub_group = StudySubGroup.find_by_id(input[:study_sub_group_id])
    if user && study_sub_group
      Right({ user: user, study_sub_group: study_sub_group})
    else
      Left(:record_not_found)
    end
  end

  def check_role(input)
    if input[:user].student?
      Right(input)
    else
      Left(:user_is_not_student)
    end
  end

  def check_study_group(input)
    if input[:user].study_group == input[:study_sub_group].study_group
      Right(input)
    else
      Left(:student_is_not_in_this_study_group)
    end
  end

  def persist(input)
    ssgs = StudySubGroupStudent.create(
      study_sub_group_id: input[:study_sub_group].id,
      user_id: input[:user].id
    )
    Right(ssgs)
  rescue ActiveRecord::RecordNotUnique
    Left(:student_is_already_assigned_to_study_sub_group)
  end
end
