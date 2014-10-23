class CreateTriggers < ActiveRecord::Migration
  def change
    create_table :triggers do |t|
      t.string :trigger_type
      t.string :word
    end
  end
end
