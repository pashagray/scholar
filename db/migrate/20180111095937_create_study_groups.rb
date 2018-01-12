class CreateStudyGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :study_groups do |t|
      t.string :title
      t.string :level

      t.timestamps
    end
    add_index :study_groups, [:title, :level], unique: true
  end
end
