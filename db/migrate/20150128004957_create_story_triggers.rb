class CreateStoryTriggers < ActiveRecord::Migration
  def change
    create_table :story_triggers do |t|
      t.integer :story_id
      t.integer :trigger_id

      t.timestamps
    end
  end
end
