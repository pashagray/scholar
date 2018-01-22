module My
  class WelcomeController < BaseController

    skip_before_action :check_password!, only: [:change_password, :confirm_change_password]

    def index
    end

    def change_password
    end

    def confirm_change_password
      if current_user.update(
        password: params[:password],
        password_confirmation: params[:password_confirmation]
      )
        sign_in(current_user, bypass: true)
        flash[:success] = 'Пароль успешно изменен.'
        redirect_to my_path
      else
        flash[:error] = 'Пароли не совпадают. Попробуйте снова.'
        redirect_to my_change_password_path
      end
    end
  end
end