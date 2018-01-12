class AssignSupervisorToStudyGroup
  include Dry::Transaction

  step :find
  step :check_role
  step :persist

  def find(input)
    user = User.find_by_id(input[:teacher_id])
    study_group = StudyGroup.find_by_id(input[:study_group_id])
    if user && study_group
      Right({ user: user, study_group: study_group})
    else
      Left(:record_not_found)
    end
  end

  def check_role(input)
    if input[:user].teacher?
      Right(input)
    else
      Left(:user_is_not_teacher)
    end
  end

  def persist(input)
    sgs = StudyGroupSupervisor.create(
      study_group_id: input[:study_group].id,
      user_id: input[:user].id
    )
    Right(sgs)
  rescue ActiveRecord::RecordNotUnique
    Left(:supervisor_is_already_assigned_to_this_study_group)
  end
end
