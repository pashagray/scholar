module Admin
  class AttachmentsController < BaseController
    def create
      @attachment = Attachment.new(attach_params)
      # @attachment.filename = params[:attachment][:doc].original_filename
      if @attachment.save
        flash[:success] = 'Файл успешно прикреплен'
      else
        flash[:error] = 'Файл не прикреплен'
      end
      redirect_back(fallback_location: admin_users_path)
    end

    def destroy
      @attachment = Attachment.find(params[:id])
      if @attachment.destroy
        flash[:success] = 'Файл успешно удален'
      else
        flash[:error] = 'Файл не удален'
      end
      redirect_back(fallback_location: admin_users_path)
    end

    private

    def attach_params
      params.require(:attachment).permit!
    end
  end
end