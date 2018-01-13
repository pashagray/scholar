class CreateAdverts < ActiveRecord::Migration[5.1]
  def change
    create_table :adverts do |t|
      t.string :advertable_type
      t.integer :advertable_id
      t.string :title
      t.text :content
      t.integer :author_id
      t.boolean :pinned

      t.timestamps
    end
    add_index :adverts, :advertable_type
    add_index :adverts, :advertable_id
    add_index :adverts, [:advertable_type, :advertable_id]
    add_index :adverts, :author_id
    add_index :adverts, :pinned
  end
end
