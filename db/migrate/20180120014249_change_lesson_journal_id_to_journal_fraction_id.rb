class ChangeLessonJournalIdToJournalFractionId < ActiveRecord::Migration[5.1]
  def change
    remove_index :lessons, :journal_id
    remove_column :lessons, :journal_id, :integer
    add_column :lessons, :journal_fraction_id, :integer
    add_index :lessons, :journal_fraction_id
  end
end
