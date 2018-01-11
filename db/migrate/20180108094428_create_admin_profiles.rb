class CreateAdminProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_profiles do |t|
      t.integer :user_id

      t.timestamps
    end
    add_index :admin_profiles, :user_id
  end
end
