class StoryTrigger < ActiveRecord::Base
  belongs_to :story
  belongs_to :trigger
end
