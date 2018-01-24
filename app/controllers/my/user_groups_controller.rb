module My
  class UserGroupsController < BaseController
    def show
      @user_group = UserGroup.find(params[:id])
      if @user_group.system_group?
        redirect_to [:my, @user_group.title.to_sym]
      end
    end

    def school
      @user_group = UserGroup.school
      @adverts = @user_group.adverts.order(created_at: :desc)
    end
  end
end
