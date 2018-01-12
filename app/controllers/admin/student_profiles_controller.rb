module Admin
  class StudentProfilesController < BaseController
    def create
      @user = User.find(params[:user_id])
      @deleted_student_profile = StudentProfile.only_deleted.find_by_user_id(@user.id)
      if @deleted_student_profile
        @deleted_student_profile.restore
      else
        @student_profile = StudentProfile.new(user_id: @user.id)
        @student_profile.save
      end
      redirect_to admin_user_path(@user)
    end

    def edit
      @user = User.find(params[:user_id])
      @student_profile = StudentProfile.find_by(id: params[:id], user_id: @user.id)
    end

    def update
      @user = User.find(params[:user_id])
      @student_profile = StudentProfile.find_by(id: params[:id], user_id: @user.id)
      if @student_profile.update(student_profile_params)
        redirect_to admin_user_path(@user)
      else
        render :edit
      end
    end

    def destroy
      @user = User.find(params[:user_id])
      @student_profile = StudentProfile.find_by(id: params[:id], user_id: @user.id)
      if @user.study_group
        flash[:error] = "Ученик привязан к #{@user.study_group.full_title} классу. Сначала уберите ученика из класса."
        redirect_to admin_user_path(@user)
      else
        @student_profile.destroy
        flash[:success] = 'Пользователь больше не является учеником'
        redirect_to admin_user_path(@user)
      end
    end

    def student_profile_params
      params.require(:student_profile).permit!
    end
  end
end