crumb :my do
  link 'Моя страница', my_path
end

crumb :my_notifications do
  link 'Центр уведомлений', my_notifications_path
  parent :my
end
