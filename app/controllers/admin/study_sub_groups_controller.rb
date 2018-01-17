module Admin
  class StudySubGroupsController < BaseController

    def new
      @study_group = StudyGroup.find(params[:study_group_id])
      @study_sub_group = @study_group.study_sub_groups.new
    end

    def create
      @study_group = StudyGroup.find(params[:study_group_id])
      @study_sub_group = @study_group.study_sub_groups.new(study_sub_group_params)
      if @study_sub_group.save
        redirect_to [:admin, @study_group, @study_sub_group]
      else
        render :new
      end
    end

    def show
      @study_sub_group = StudySubGroup.find(params[:id])
      @study_group = @study_sub_group.study_group
    end

    def edit
      @study_sub_group = StudySubGroup.find(params[:id])
      @study_group = @study_sub_group.study_group
    end

    def update
      @study_sub_group = StudySubGroup.find(params[:id])
      @study_group = @study_sub_group.study_group
      if @study_sub_group.update(study_sub_group_params)
        redirect_to [:admin, @study_group]
      else
        render :edit
      end
    end

    def assign_student
      transaction = AssignStudentToStudySubGroup.new
      result = transaction.call(
        study_sub_group_id: params[:id],
        student_id: params[:user_id]
      )
      if result.success?
        flash[:success] = I18n.t('transactions.success.student_assigned_to_study_sub_group')
        redirect_to admin_study_group_study_sub_group_path(params[:id], study_group_id: params[:study_group_id])
      else
        flash[:error] = I18n.t("transactions.error.#{result.value}")
        redirect_to admin_study_group_study_sub_group_path(params[:id], study_group_id: params[:study_group_id])
      end
    end

    def remove_student
      transaction = RemoveStudentFromStudySubGroup.new
      result = transaction.call(
        study_sub_group_id: params[:id],
        student_id: params[:user_id]
      )
      if result.success?
        flash[:success] = I18n.t('transactions.success.student_removed_from_study_sub_group')
        redirect_to admin_study_group_study_sub_group_path(params[:id], study_group_id: params[:study_group_id])
      else
        flash[:error] = I18n.t("transactions.error.#{result.value}")
        redirect_to admin_study_group_study_sub_group_path(params[:id], study_group_id: params[:study_group_id])
      end
    end

    private

    def study_sub_group_params
      params.require(:study_sub_group).permit!
    end
  end
end