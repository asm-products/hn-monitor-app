class AddHnUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hn_username, :string
  end
end
