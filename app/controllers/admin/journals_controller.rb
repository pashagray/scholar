module Admin
  class JournalsController < BaseController
    def schedule
      @academic_periods = AcademicPeriod.order(:created_at)
      @study_groups = StudyGroup.order_by_model

      @academic_period = AcademicPeriod.find_by_id(params[:academic_period_id])
      @study_group = StudyGroup.find_by_id(params[:study_group_id])
      # fraction = params[:fraction].to_sym
      if @academic_period && @study_group
        @journals = Journal.for_study_group(@study_group.id).where(academic_period_id: @academic_period.id)
      end
    end

    def create
      @journal = Journal.new(journal_params)
      if @journal.save
        flash[:success] = 'Журнал успешно создан'
      else
        flash[:error] = 'Журнал не создан'
      end
      redirect_back(fallback_location: admin_schedule_path)
    end

    def show
      @journal = Journal.find(params[:id])
      @journal_fractions = @journal.journal_fractions
    end

 private

    def journal_params
      params.require(:journal).permit!
    end
  end
end