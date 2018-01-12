class RemoveSupervisorFromStudyGroup
  include Dry::Transaction

  step :find
  step :check_role
  step :destroy

  def find(input)
    user = User.find_by_id(input[:teacher_id])
    study_group = StudyGroup.find_by_id(input[:study_group_id])
    if user && study_group
      Right({ user: user, study_group: study_group})
    else
      Left({ errors: { record: :not_found } })
    end
  end

  def check_role(input)
    sgs = StudyGroupSupervisor.find_by(
      user: input[:user], study_group: input[:study_group]
    )
    if sgs
      Right(sgs)
    else
      Left(:teacher_is_not_a_supervisor)
    end
  end

  def destroy(sgs)
    if sgs.destroy
      Right(true)
    else
      Left(:supervisor_is_not_removable_from_study_group)
    end
  end
end
