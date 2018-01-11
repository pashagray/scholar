class AddWorkExperienceToTeacherProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :teacher_profiles, :edu_work_experience, :integer
    add_column :teacher_profiles, :total_work_experience, :integer
  end
end
