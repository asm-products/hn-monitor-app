class Trigger < ActiveRecord::Base
  validates_presence_of :trigger_type, :word
  validate 'must_be_valid_type'
  validates_uniqueness_of :word, scope: :trigger_type

  has_many :story_triggers
  has_many :stories, through: :story_triggers

  has_many :user_triggers
  has_many :users, through: :user_triggers

  VALID_TYPES = ['domain', 'keyword', 'username']


  scope :usernames, -> { where(trigger_type: 'username') }
  scope :keywords, -> { where(trigger_type: 'keyword') }
  scope :domains, -> { where(trigger_type: 'domain')}

  def must_be_valid_type
    unless VALID_TYPES.include?(self.trigger_type)
      errors.add(:type, "Invalid trigger type!")
    end
  end


end