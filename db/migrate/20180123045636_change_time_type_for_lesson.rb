class ChangeTimeTypeForLesson < ActiveRecord::Migration[5.1]
  def change
    remove_column :lessons, :starts_at, :integer
    remove_column :lessons, :ends_at, :integer
    add_column :lessons, :starts_at, :datetime
    add_column :lessons, :ends_at, :datetime
  end
end
