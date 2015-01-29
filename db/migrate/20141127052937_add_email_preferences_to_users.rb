class AddEmailPreferencesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email_frequency, :integer, default: 0
    add_index :users, :email_frequency
  end
end
