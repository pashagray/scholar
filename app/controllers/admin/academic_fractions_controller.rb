module Admin
  class AcademicFractionsController < BaseController

    def new
      @academic_period = AcademicPeriod.find(params[:academic_period_id])
      @academic_fraction = @academic_period.academic_fractions.new
    end

    def create
      @academic_period = AcademicPeriod.find(params[:academic_period_id])
      @academic_fraction = @academic_period.academic_fractions.new(academic_fraction_params)
      if @academic_fraction.save
        redirect_to [:admin, @academic_period]
      else
        render :new
      end
    end

    def show
      @academic_fraction = AcademicFraction.find(params[:id])
      @academic_period = @academic_fraction.academic_period
    end

    def edit
      @academic_fraction = AcademicFraction.find(params[:id])
      @academic_period = @academic_fraction.academic_period
    end

    def update
      @academic_fraction = AcademicFraction.find(params[:id])
      @academic_period = @academic_fraction.academic_period
      if @academic_fraction.update(academic_fraction_params)
        redirect_to [:admin, @academic_period]
      else
        render :edit
      end
    end

    def destroy
      @academic_fraction = AcademicFraction.find(params[:id])
      @academic_period = @academic_fraction.academic_period
      if @academic_fraction.destroy
        flash[:success] = 'Четверть успешно удалена'
        redirect_to [:admin, @academic_period]
      else
        flash[:error] = 'Четверть не удалена'
        redirect_to [:admin, @academic_period]
      end
    end

    private

    def academic_fraction_params
      params.require(:academic_fraction).permit!
    end
  end
end