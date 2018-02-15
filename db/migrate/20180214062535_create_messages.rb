class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :user_id, null: false
      t.integer :chat_id, null: false

      t.timestamps
    end
    add_index :messages, :user_id
    add_index :messages, :chat_id
    add_index :messages, [:user_id, :chat_id]
  end
end
