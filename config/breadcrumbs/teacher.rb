crumb :teacher do
  link 'Главная', teacher_path
end

crumb :teacher_supervising_study_groups do
  link 'Мои классы', supervising_teacher_study_groups_path
  parent :teacher
end

crumb :teacher_study_group do |sg|
  link sg.full_title, teacher_study_group_path(sg)
  parent :teacher_supervising_study_groups
end
