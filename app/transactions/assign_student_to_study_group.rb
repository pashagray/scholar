class AssignStudentToStudyGroup
  include Dry::Transaction

  step :find
  step :check_role
  step :persist

  def find(input)
    user = User.find_by_id(input[:student_id])
    study_group = StudyGroup.find_by_id(input[:study_group_id])
    if user && study_group
      Right({ user: user, study_group: study_group})
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

  def persist(input)
    sgs = StudyGroupStudent.create(
      study_group_id: input[:study_group].id,
      user_id: input[:user].id
    )
    Right(sgs)
  rescue ActiveRecord::RecordNotUnique
    Left(:student_is_already_assigned_to_study_group)
  end
end
