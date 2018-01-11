class CreateTeacherProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :teacher_profiles do |t|
      t.integer :user_id
      t.date :date_of_admission

      t.timestamps
    end
    add_index :teacher_profiles, :user_id
    add_index :teacher_profiles, :date_of_admission
  end
end
