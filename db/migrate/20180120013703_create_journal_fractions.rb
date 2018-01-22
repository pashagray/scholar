class CreateJournalFractions < ActiveRecord::Migration[5.1]
  def change
    create_table :journal_fractions do |t|
      t.integer :journal_id
      t.date :starts_on
      t.date :ends_on
      t.string :title

      t.timestamps
    end
    add_index :journal_fractions, :journal_id
    add_index :journal_fractions, :starts_on
    add_index :journal_fractions, :ends_on
    add_index :journal_fractions, :title
  end
end
