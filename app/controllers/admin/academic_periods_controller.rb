module Admin
  class AcademicPeriodsController < BaseController
    def index
      @table_handler = TableHandler::AdminAcademicPeriodsIndex.new(current_user.config)
      @q = AcademicPeriod.ransack(params[:q])
      @academic_periods = @q.result
    end

    def new
      @academic_period = AcademicPeriod.new
    end

    def create
      @academic_period = AcademicPeriod.new(academic_period_params)
      if @academic_period.save
        redirect_to admin_academic_period_path(@academic_period)
      else
        render :new
      end
    end

    def show
      @academic_period = AcademicPeriod.find(params[:id])
      @academic_fractions = @academic_period.academic_fractions
      @table_handler = TableHandler::AdminAcademicFractionsIndex.new(current_user.config)
    end

    def edit
      @academic_period = AcademicPeriod.find(params[:id])
    end

    def update
      @academic_period = AcademicPeriod.find(params[:id])
      if @academic_period.update(academic_period_params)
        redirect_to admin_academic_period_path(@academic_period)
      else
        render :edit
      end 
    end

    private

    def academic_period_params
      params.require(:academic_period).permit!
    end
  end
end