module Admin
  class JournalFractionsController < BaseController

    def new
      @journal = Journal.find(params[:journal_id])
      @journal_fraction = @journal.journal_fractions.new
    end

    def create
      @journal = Journal.find(params[:journal_id])
      @journal_fraction = @journal.journal_fractions.new(journal_fraction_params)
      range = @journal.academic_period.send(journal_fraction_params[:title].to_sym)
      @journal_fraction.starts_on = range.first
      @journal_fraction.ends_on = range.last
      if @journal_fraction.save
        redirect_to [:admin, @journal]
      else
        render :new
      end
    end

    def show
      @journal_fraction = JournalFraction.find(params[:id])
      @lessons = @journal_fraction.lessons.order(:day)
      @journal = @journal_fraction.journal
    end

    def edit
      @journal_fraction = JournalFraction.find(params[:id])
      @journal = @journal_fraction.journal
    end

    def update
      @journal_fraction = JournalFraction.find(params[:id])
      @journal = @journal_fraction.journal
      if @journal_fraction.update(journal_fraction_params)
        redirect_to [:admin, @journal]
      else
        render :edit
      end
    end

    def destroy
      @journal_fraction = JournalFraction.find(params[:id])
      @journal = @journal_fraction.journal
      if @journal_fraction.destroy
        flash[:success] = 'Раздел журнала успешно удален'
      else
        flash[:error] = 'Раздел журнала не удален'
      end
      redirect_back(fallback_location: [:admin, @journal])
    end

    def create_lessons
      t = CreateLessons.new
      result = t.call(params)
      if result.success
        flash[:success] = 'Уроки успешно добавлены'
      else
        flash[:error] = 'Уроки не добавлены'
      end
      redirect_back(fallback_location: [:admin, :schedule_generator])
    end

    private

    def journal_fraction_params
      params.require(:journal_fraction).permit!
    end
  end
end