class ChangeIinColumnForUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :iin
    add_column :users, :iin, :string, null: false, default: ''
    add_index :users, :iin, unique: true
  end
end
