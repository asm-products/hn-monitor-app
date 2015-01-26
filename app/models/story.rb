class Story < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :hn_id, presence: true
  validates :link, presence: true


end
