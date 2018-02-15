class AddKindToChat < ActiveRecord::Migration[5.1]
  def change
    add_column :chats, :kind, :string, null: false, default: "dialog"
    add_index :chats, :kind
  end
end
