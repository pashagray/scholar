class CreateAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :attachments, id: :uuid do |t|
      t.string :attachmentable_type
      t.integer :attachmentable_id
      t.string :doc

      t.timestamps
    end
    add_index :attachments, :attachmentable_type
    add_index :attachments, :attachmentable_id
    add_index :attachments, [:attachmentable_type, :attachmentable_id]
    add_index :attachments, :doc
  end
end
