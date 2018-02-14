class CreateMessages < ActiveRecord::Migration[5.1]
  def up
    create_table :messages do |t|
      t.text :content
      t.belongs_to :chat, foreign_key: true
      t.integer :author_id
      t.string :attachment

      t.timestamps
    end
  end

  def down
    drop_table :messages
  end
end
