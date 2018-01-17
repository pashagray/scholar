crumb :admin do
  link 'Главная', admin_path
end

crumb :admin_settings do
  link 'Настройки', admin_settings_path
  parent :admin
end

crumb :admin_subjects do
  link 'Предметы', admin_subjects_path
  parent :admin
end

crumb :new_admin_subject do
  link 'Добавить предмет', new_admin_subject_path
  parent :admin_subjects
end

crumb :admin_subject do |subject|
  link subject.title, admin_subject_path(subject)
  parent :admin_subjects
end

crumb :edit_admin_subject do |subject|
  link 'Редактировать предмет', edit_admin_subject_path(subject)
  parent :admin_subject, subject
end

crumb :admin_academic_periods do
  link 'Календарный план', admin_academic_periods_path
  parent :admin
end

crumb :new_admin_academic_period do
  link 'Добавить учебный год', new_admin_academic_period_path
  parent :admin_academic_periods
end

crumb :admin_academic_period do |ap|
  link ap.title, admin_academic_period_path(ap)
  parent :admin_academic_periods
end

crumb :edit_admin_academic_period do |ap|
  link 'Редактировать период', edit_admin_academic_period_path(ap)
  parent :admin_academic_period, ap
end

crumb :new_admin_academic_period_academic_fraction do |ap|
  link 'Добавить четверть', new_admin_academic_period_academic_fraction_path(academic_period_id: ap.id)
  parent :admin_academic_period, ap
end

crumb :admin_academic_period_academic_fraction do |ap, af|
  link "Четверть #{af.title}", admin_academic_period_academic_fraction_path(af, academic_period_id: ap.id)
  parent :admin_academic_period, ap
end

crumb :edit_admin_academic_period_academic_fraction do |ap, af|
  link 'Редактировать четверть', edit_admin_academic_period_academic_fraction_path(af, academic_period_id: ap.id)
  parent :admin_academic_period_academic_fraction, ap, af
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

crumb :new_admin_study_group_study_sub_group do |sg|
  link 'Новая учебная группа', [:new, :admin, sg, :study_sub_group]
  parent :admin_study_group, sg
end

crumb :admin_study_group_study_sub_group do |sg, ssg|
  link ssg.title, [:edit, :admin, sg, :study_sub_group]
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