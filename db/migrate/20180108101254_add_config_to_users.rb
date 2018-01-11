class AddConfigToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :config, :jsonb, default: {}
  end
end
