class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.integer :journal_id
      t.date :day
      t.integer :starts_at
      t.integer :ends_at

      t.timestamps
    end
    add_index :lessons, :journal_id
    add_index :lessons, :day
  end
end
