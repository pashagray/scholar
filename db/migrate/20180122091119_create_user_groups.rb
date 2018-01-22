class CreateUserGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :user_groups do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
    add_index :user_groups, :title, unique: true
  end
end
