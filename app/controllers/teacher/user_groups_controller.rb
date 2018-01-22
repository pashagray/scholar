module Teacher
  class UserGroupsController < BaseController
    def show
      @user_group = UserGroup.find(params[:id])
      if @user_group.system_group?
        redirect_to [:teacher, @user_group.title.to_sym]
      end
    end

    def teachers_room
      @user_group = UserGroup.find_by(title: 'teachers_room')
      @adverts = @user_group.adverts.order(created_at: :desc)
    end
  end
end