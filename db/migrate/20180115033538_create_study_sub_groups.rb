class CreateStudySubGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :study_sub_groups do |t|
      t.integer :study_group_id
      t.string :title

      t.timestamps
    end
  end
end
