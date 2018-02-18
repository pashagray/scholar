module Admin
  class AdminProfilesController < BaseController
    def create
      @user = User.find(params[:user_id])
      @deleted_admin_profile = AdminProfile.only_deleted.find_by_user_id(@user.id)
      if @deleted_admin_profile
        @deleted_admin_profile.restore
      else
        @admin_profile = AdminProfile.new(user_id: @user.id)
        @admin_profile.save
      end
      redirect_to admin_user_path(@user)
    end

    # def edit
    #   @user = User.find(params[:user_id])
    #   @admin_profile = AdminProfile.find_by(id: params[:id], user_id: @user.id)
    # end

    # def update
    #   @user = User.find(params[:user_id])
    #   @admin_profile = AdminProfile.find_by(id: params[:id], user_id: @user.id)
    #   if @admin_profile.update(admin_profile_params)
    #     redirect_to admin_user_path(@user)
    #   else
    #     render :edit
    #   end
    # end

    def destroy
      @user = User.find(params[:user_id])
      @admin_profile = AdminProfile.find_by(id: params[:id], user_id: @user.id)
      @admin_profile.destroy
      flash[:success] = 'Пользователь больше не является администратором'
      redirect_to admin_user_path(@user)
    end

    def admin_profile_params
      params.require(:admin_profile).permit!
    end
  end
end