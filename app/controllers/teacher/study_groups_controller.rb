module Teacher
  class StudyGroupsController < BaseController
    def show
      @study_group = current_user.supervising_study_groups.find(params[:id])
      @adverts = @study_group.adverts.order(created_at: :desc)
    end
  end
end