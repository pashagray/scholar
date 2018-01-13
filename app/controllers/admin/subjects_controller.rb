module Admin
  class SubjectsController < BaseController
    def index
      @table_handler = TableHandler::AdminSubjectsIndex.new(current_user.config)
      @q = Subject.ransack(params[:q])
      @subjects = @q.result.alphabetical_order
    end

    def new
      @subject = Subject.new
    end

    def create
      @subject = Subject.new(subject_params)
      if @subject.save
        redirect_to admin_subject_path(@subject)
      else
        render :new
      end
    end

    def show
      @subject = Subject.find(params[:id])
    end

    def edit
      @subject = Subject.find(params[:id])
    end

    def update
      @subject = Subject.find(params[:id])
      if @subject.update(subject_params)
        redirect_to admin_subject_path(@subject)
      else
        render :edit
      end 
    end

    private

    def subject_params
      params.require(:subject).permit!
    end
  end
end