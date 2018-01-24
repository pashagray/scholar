crumb :my do
  link 'Моя страница', my_path
end

crumb :my_messenger do
  link 'Мессенджер', my_messenger_path
  parent :my
end

crumb :my_notifications do
  link 'Центр уведомлений', my_notifications_path
  parent :my
end

crumb :my_school do
  link 'Моя школа', my_school_path
  parent :my
end