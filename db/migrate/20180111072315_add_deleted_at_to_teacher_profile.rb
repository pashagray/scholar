class AddDeletedAtToTeacherProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :teacher_profiles, :deleted_at, :datetime
    add_index :teacher_profiles, :deleted_at
  end
end
