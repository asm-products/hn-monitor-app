class RemoveContentAddHnIdToStory < ActiveRecord::Migration
  def change
    add_column :stories, :hn_id, :integer
    remove_column :stories, :content, :string
  end
end
