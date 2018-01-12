crumb :admin do
  link 'Главная', admin_path
end

crumb :admin_settings do
  link 'Настройки', admin_settings_path
  parent :admin
end

crumb :admin_users do
  link 'Пользователи', admin_users_path
  parent :admin
end

crumb :admin_users_students do
  link 'Ученики', students_admin_users_path
  parent :admin_users
end

crumb :admin_users_teachers do
  link 'Учителя', teachers_admin_users_path
  parent :admin_users
end

crumb :admin_users_custodians do
  link 'Родители', custodians_admin_users_path
  parent :admin_users
end

crumb :admin_users_admins do
  link 'Администраторы', admins_admin_users_path
  parent :admin_users
end

crumb :new_admin_user do
  link 'Добавить пользователя', new_admin_user_path
  parent :admin_users
end

crumb :admin_user do |user|
  link user.full_name, admin_user_path(user)
  parent :admin_users
end

crumb :admin_user_edit do |user|
  link 'Редактировать пользователя', edit_admin_user_path(user)
  parent :admin_user, user
end

crumb :admin_user_student_profile_edit do |user, student_profile|
  link 'Редактировать анкету ученика', edit_admin_user_student_profile_path(id: student_profile.id, user_id: user.id)
  parent :admin_user, user
end

crumb :admin_user_teacher_profile_edit do |user, teacher_profile|
  link 'Редактировать анкету учителя', edit_admin_user_teacher_profile_path(id: teacher_profile.id, user_id: user.id)
  parent :admin_user, user
end

crumb :admin_study_groups do
  link 'Классы', admin_study_groups_path
  parent :admin
end

crumb :new_admin_study_group do
  link 'Добавить класс', new_admin_study_group_path
  parent :admin_study_groups
end

crumb :admin_study_group do |sg|
  link sg.full_title, admin_study_group_path(sg)
  parent :admin_study_groups
end

crumb :edit_admin_study_group do |sg|
  link 'Редактировать класс', edit_admin_study_group_path(sg)
  parent :admin_study_group, sg
end


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).