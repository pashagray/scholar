module Admin
  class JournalsController < BaseController

    def schedule
      params[:year] = Date.today.year if params[:year].blank?
      params[:week] = Date.today.cweek if params[:week].blank?
      mon = Date.commercial(params[:year].to_i, params[:week].to_i)
      @dates = mon..(mon + 6.days)
      @lessons = Lesson.for_week(params[:year].to_i, params[:week].to_i).order(:starts_at)
    end

    def schedule_generator
      params[:academic_period_id] = AcademicPeriod.current.try(:id) if params[:academic_period_id].blank?
      @academic_periods = AcademicPeriod.order(:created_at)
      @study_groups = StudyGroup.order_by_model

      @academic_period = AcademicPeriod.find_by_id(params[:academic_period_id])
      @study_group = StudyGroup.find_by_id(params[:study_group_id])
      # fraction = params[:fraction].to_sym
      if @academic_period && @study_group
        @journals = Journal.for_study_group(@study_group.id).where(academic_period_id: @academic_period.id)
        @journal_fractions = JournalFraction.send(params[:fraction].to_sym).where(journal_id: @journals.map(&:id))
      end
    end

    def create
      @journal = Journal.new(journal_params)
      if @journal.save
        flash[:success] = 'Журнал успешно создан'
      else
        flash[:error] = 'Журнал не создан'
      end
      redirect_back(fallback_location: admin_schedule_generator_path)
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