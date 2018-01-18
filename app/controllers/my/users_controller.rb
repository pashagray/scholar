module My
  class UsersController < BaseController
    def update
      if current_user.update(user_params)
        flash[:success] = 'Данные успешно обновлены'
      else
        flash[:error] = 'Данные не обновлены'
      end
      redirect_to my_path
    end

    private

    def user_params
      params.require(:user).permit(:avatar)
    end
  end
end
