class Story < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :hn_id, presence: true
  validates :link, presence: true
  #validates :hn_user, presence: true
  validates :triggers, presence: true

  has_many :story_triggers
  has_many :triggers, through: :story_triggers



end
