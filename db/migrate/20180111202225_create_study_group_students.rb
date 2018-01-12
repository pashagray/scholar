class CreateStudyGroupStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :study_group_students do |t|
      t.integer :user_id
      t.integer :study_group_id

      t.timestamps
    end
    add_index :study_group_students, :user_id, unique: true
    add_index :study_group_students, :study_group_id
  end
end
