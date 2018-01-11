class CreateCustodianProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :custodian_profiles do |t|
      t.integer :user_id

      t.timestamps
    end
    add_index :custodian_profiles, :user_id
  end
end
