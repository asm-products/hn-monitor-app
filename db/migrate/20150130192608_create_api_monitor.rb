class CreateApiMonitor < ActiveRecord::Migration
  def change
    create_table :api_monitors do |t|
      t.integer :hn_id
    end
    add_index :api_monitors, :hn_id
  end
end
