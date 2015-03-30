class ApiMonitor < ActiveRecord::Base
  def self.fetch_stories
    stories = new_stories
    return false if stories.size == 0
    create_all stories
    return true
  end

  def self.new_stories
    stories = (last_max...max).map do |item|
      response = client.get_item(item)
      response if response.type == 'story'
    end.compact
    stories
  end

  def self.create_all stories
    stories.each do |story|
      Story.create(
        {title: story.title,
          link: story.url,
          hn_id: story.id.to_i})
    end
    stories
  end

  def self.client
    @@client ||= HackernewsRuby::Client.new
  end

  def self.max
    ApiMonitor.create(hn_id: client.max_item.to_i).hn_id
  end

  def self.last_max
    return ApiMonitor.order(hn_id: :desc).limit(1).first.hn_id unless ApiMonitor.count == 0
    max
  end
end
