module Admin
  class UsersController < BaseController
    def index
      @table_handler = TableHandler::AdminUsersIndex.new(current_user.config)
      @users = User.order(:last_name, :first_name, :middle_name)
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
      password = 8.times.map { rand(0..9) }.join('')
      @user = User.new(user_params.merge(password: password, temp_password: password))
      if @user.save
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

    def user_params
      params.require(:user).permit!
    end
  end
end