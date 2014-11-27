class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_triggers
  has_many :triggers, through: :user_triggers

  enum email_frequency: [:notify_immediately, :notify_daily, :notify_weekly]

  validates :email_frequency, presence: true, inclusion: { in: self.email_frequencies }
end
