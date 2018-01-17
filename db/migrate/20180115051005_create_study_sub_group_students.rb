class CreateStudySubGroupStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :study_sub_group_students do |t|
      t.integer :study_sub_group_id
      t.integer :user_id

      t.timestamps
    end
    add_index :study_sub_group_students, :study_sub_group_id
    add_index :study_sub_group_students, :user_id
    add_index :study_sub_group_students, [:user_id, :study_sub_group_id], unique: true, name: 'index_ssgs_on_user_id_and_study_sub_group_id'
  end
end
