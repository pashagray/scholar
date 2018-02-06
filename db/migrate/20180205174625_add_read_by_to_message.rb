class AddReadByToMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :read_by, :text, array: true, default: []
  end
end
