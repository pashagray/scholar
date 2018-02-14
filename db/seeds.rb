# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

av_gen = AvatarGenerator.new

# ADMIN
admin = User.create(
  first_name: 'Иван',
  last_name: 'Иванов',
  middle_name: 'Иванович',
  iin: 880909300211,
  password: '12345678',
  gender: 'male',
  remote_avatar_url: av_gen.call
)
AdminProfile.create(user_id: admin.id)


# TEACHER
teacher = User.create(
  first_name: 'Петр',
  last_name: 'Петров',
  middle_name: 'Петрович',
  iin: 901211679007,
  password: '12345678',
  gender: 'male',
  remote_avatar_url: av_gen.call
)
TeacherProfile.create(user_id: teacher.id)
