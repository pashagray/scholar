module Admin
  class TeacherProfilesController < BaseController
    def create
      @user = User.find(params[:user_id])
      @deleted_teacher_profile = TeacherProfile.only_deleted.find_by_user_id(@user.id)
      if @deleted_teacher_profile
        @deleted_teacher_profile.restore
      else
        @teacher_profile = TeacherProfile.new(user_id: @user.id)
        @teacher_profile.save
      end
      ug = UserGroup.find_or_create_by(title: 'teachers_room')
      UserInGroup.find_or_create_by(user_id: @user.id, user_group_id: ug.id)
      redirect_to admin_user_path(@user)
    end

    def edit
      @user = User.find(params[:user_id])
      @teacher_profile = TeacherProfile.find_by(id: params[:id], user_id: @user.id)
    end

    def update
      @user = User.find(params[:user_id])
      @teacher_profile = TeacherProfile.find_by(id: params[:id], user_id: @user.id)
      if @teacher_profile.update(teacher_profile_params)
        redirect_to admin_user_path(@user)
      else
        render :edit
      end
    end

    def destroy
      @user = User.find(params[:user_id])
      @teacher_profile = TeacherProfile.find_by(id: params[:id], user_id: @user.id)
      @teacher_profile.destroy
      ug = UserGroup.find_by(title: 'teachers_room')
      uig = @user.user_in_groups.find_by(user_group_id: ug.id)
      uig.destroy
      redirect_to admin_user_path(@user)
    end

    def teacher_profile_params
      params.require(:teacher_profile).permit!
    end
  end
end