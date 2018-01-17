class WelcomeController < ApplicationController
  def index
    role_selector = RoleSelector.new
    role_selector
      .on(:multirole) { redirect_to multirole_path }
      .on(:admin)     { redirect_to admin_path }
      .on(:student)   { redirect_to student_path }
      .on(:teacher)   { redirect_to teacher_path }
      .on(:custodian) { redirect_to custodian_path }
      .on(:none)      { redirect_to no_role_path }
    role_selector.call(current_user.roles)
  end
end