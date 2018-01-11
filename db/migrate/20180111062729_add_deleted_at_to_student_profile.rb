class AddDeletedAtToStudentProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :student_profiles, :deleted_at, :datetime
    add_index :student_profiles, :deleted_at
  end
end
