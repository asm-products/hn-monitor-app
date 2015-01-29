class Story < ActiveRecord::Base
  before_validation :add_triggers

  validates :title, presence: true, uniqueness: true
  validates :hn_id, presence: true
  validates :link, presence: true
  validates :hn_user, presence: true
  validates :triggers, presence: true

  has_many :story_triggers
  has_many :triggers, through: :story_triggers


  protected
  def add_triggers
    check_title
    check_user
    check_link
  end

  def check_user
    Trigger.usernames.each do |trig|
      if trig.word == self.hn_user
        self.triggers << trig
        break
      end
    end
  end

  def check_title
    Trigger.keywords.each do |trig|
      if self.title.include?(trig.word)
        self.triggers << trig
      end
    end
  end

  def check_link
    Trigger.domains.each do |trig|
      if self.link.include?(trig.word)
        self.triggers << trig
      end
    end
  end

end
