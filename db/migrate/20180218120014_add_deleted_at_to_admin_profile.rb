class AddDeletedAtToAdminProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :admin_profiles, :deleted_at, :datetime
    add_index :admin_profiles, :deleted_at
  end
end
