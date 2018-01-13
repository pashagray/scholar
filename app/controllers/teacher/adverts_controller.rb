module Teacher
  class AdvertsController < BaseController

    def create
      klass = params[:advert][:advertable_type].constantize
      @advertable = klass.find(params[:advert][:advertable_id])
      @advert = @advertable.adverts.new(advert_params)
      @advert.author = current_user
      if @advert.save
        flash[:success] = 'Объявление успешно добавлено'
        redirect_to [:teacher, @advertable]
      else
        flash[:error] = 'Ошибка добавления объявления'
        redirect_to [:teacher, @advertable]
      end
    end

    def destroy
      @advert = Advert.find(params[:id])
      @advertable = @advert.advertable
      if @advert.destroy
        flash[:success] = 'Объявление успешно удалено'
        redirect_to [:teacher, @advertable]
      else
        flash[:error] = 'Ошибка удаления объявления'
        redirect_to [:teacher, @advertable]
      end
    end

    private

    def advert_params
      params.require(:advert).permit(:advertable_type, :advertable_id, :title, :content, :pinned)
    end
  end
end