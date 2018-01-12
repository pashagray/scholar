module Admin
  class StudyGroupsController < BaseController
    def index
      @table_handler = TableHandler::AdminStudyGroupsIndex.new(current_user.config)
      @q = StudyGroup.ransack(params[:q])
      @study_groups = @q.result.order_by_model.includes(:students)
    end

    def new
      @study_group = StudyGroup.new
    end

    def create
      @study_group = StudyGroup.new(study_group_params)
      if @study_group.save
        redirect_to admin_study_group_path(@study_group)
      else
        render :new
      end
    end

    def show
      @study_group = StudyGroup.find(params[:id])
    end

    def edit
      @study_group = StudyGroup.find(params[:id])
    end

    def update
      @study_group = StudyGroup.find(params[:id])
      if @study_group.update(study_group_params)
        redirect_to admin_study_group_path(@study_group)
      else
        render :edit
      end 
    end

    def assign_student
      transaction = AssignStudentToStudyGroup.new
      result = transaction.call(
        study_group_id: params[:id],
        student_id: params[:user_id]
      )
      if result.success?
        flash[:success] = I18n.t('transactions.success.student_assigned_to_study_group')
        redirect_to admin_study_group_path(params[:id])
      else
        flash[:error] = I18n.t("transactions.error.#{result.value}")
        redirect_to admin_study_group_path(params[:id])
      end
    end

    def remove_student
      transaction = RemoveStudentFromStudyGroup.new
      result = transaction.call(
        study_group_id: params[:id],
        student_id: params[:user_id]
      )
      if result.success?
        flash[:success] = I18n.t('transactions.success.student_removed_from_study_group')
        redirect_to admin_study_group_path(params[:id])
      else
        flash[:error] = I18n.t("transactions.error.#{result.value}")
        redirect_to admin_study_group_path(params[:id])
      end
    end

    def assign_supervisor
      transaction = AssignSupervisorToStudyGroup.new
      result = transaction.call(
        study_group_id: params[:id],
        teacher_id: params[:user_id]
      )
      if result.success?
        flash[:success] = I18n.t('transactions.success.supervisor_assigned_to_study_group')
        redirect_to admin_study_group_path(params[:id])
      else
        flash[:error] = I18n.t("transactions.error.#{result.value}")
        redirect_to admin_study_group_path(params[:id])
      end
    end

    def remove_supervisor
      transaction = RemoveSupervisorFromStudyGroup.new
      result = transaction.call(
        study_group_id: params[:id],
        teacher_id: params[:user_id]
      )
      if result.success?
        flash[:success] = I18n.t('transactions.success.supervisor_removed_from_study_group')
        redirect_to admin_study_group_path(params[:id])
      else
        flash[:error] = I18n.t("transactions.error.#{result.value}")
        redirect_to admin_study_group_path(params[:id])
      end
    end

    private

    def study_group_params
      params.require(:study_group).permit!
    end
  end
end