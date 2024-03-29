module Admin
  class UsersController < BaseController
    def index
      @table_handler = TableHandler::AdminUsersIndex.new(current_user.config)
      @q = User.ransack(params[:q])
      @users = @q.result.order(:last_name, :first_name, :middle_name)
    end

    def students
      @table_handler = TableHandler::AdminUsersStudents.new(current_user.config)
      @users = User.students.order(:last_name, :first_name, :middle_name)
    end

    def teachers
      @table_handler = TableHandler::AdminUsersTeachers.new(current_user.config)
      @users = User.teachers.order(:last_name, :first_name, :middle_name)
    end

    def custodians
      @table_handler = TableHandler::AdminUsersCustodians.new(current_user.config)
      @users = User.custodians.order(:last_name, :first_name, :middle_name)
    end

    def admins
      @table_handler = TableHandler::AdminUsersAdmins.new(current_user.config)
      @users = User.admins.order(:last_name, :first_name, :middle_name)
    end

    def new
      @user = User.new
    end

    def create
      password = generate_password
      @user = User.new(
        user_params.merge(
          password: password, 
          temp_password: password,
          remote_avatar_url: AvatarGenerator.new.call
        )
      )
      if @user.save
        ug = UserGroup.find_or_create_by(title: 'school')
        UserInGroup.find_or_create_by(user_id: @user.id, user_group_id: ug.id)
        redirect_to admin_user_path(@user)
      else
        render :new
      end
    end

    def show
      @user = User.find(params[:id])
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to admin_user_path(@user)
      else
        render :edit
      end 
    end

    def reset_password
      @user = User.find(params[:id])
      password = generate_password
      @user.update(password: password, temp_password: password)
      redirect_to admin_user_path(@user)
    end

    private

    def generate_password
      6.times.map { rand(0..9) }.join('')
    end

    def user_params
      params.require(:user).permit!
    end
  end
end