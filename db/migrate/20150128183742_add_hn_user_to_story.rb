class AddHnUserToStory < ActiveRecord::Migration
  def change
    add_column :stories, :hn_user, :string
  end
end
