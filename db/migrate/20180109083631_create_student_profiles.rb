class CreateStudentProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :student_profiles do |t|
      t.integer :user_id
      t.date :date_of_admission

      t.timestamps
    end
    add_index :student_profiles, :user_id
    add_index :student_profiles, :date_of_admission
  end
end
