class CreateStudyGroupSupervisors < ActiveRecord::Migration[5.1]
  def change
    create_table :study_group_supervisors do |t|
      t.integer :user_id
      t.integer :study_group_id

      t.timestamps
    end
    add_index :study_group_supervisors, [:user_id, :study_group_id], unique: true
  end
end
