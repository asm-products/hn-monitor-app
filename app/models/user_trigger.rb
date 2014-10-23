class UserTrigger < ActiveRecord::Base
  belongs_to :user
  belongs_to :trigger
end