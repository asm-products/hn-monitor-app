class Story < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  validates :link, presence: true
end
