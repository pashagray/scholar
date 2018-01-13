class AddAvatarToStudyGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :study_groups, :avatar, :string
  end
end
