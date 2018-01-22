class CreateJournals < ActiveRecord::Migration[5.1]
  def change
    create_table :journals do |t|
      t.string :subject_id, null: false
      t.string :journable_type, null: false
      t.integer :journable_id, null: false
      t.integer :teacher_id, null: false
      t.integer :academic_period_id, null: false
      t.boolean :published, null: false, default: false

      t.timestamps
    end
    add_index :journals, :subject_id
    add_index :journals, :teacher_id
    add_index :journals, :journable_type
    add_index :journals, :journable_id
    add_index :journals, :published
    add_index :journals, [:journable_type, :journable_id]
  end
end
