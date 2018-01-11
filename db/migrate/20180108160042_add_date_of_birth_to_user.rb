class AddDateOfBirthToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :date_of_birth, :date
    add_index :users, :date_of_birth
  end
end
