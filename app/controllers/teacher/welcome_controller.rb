module Teacher
  class WelcomeController < BaseController
    def index
      @user_group = UserGroup.teachers_room
    end
  end
end