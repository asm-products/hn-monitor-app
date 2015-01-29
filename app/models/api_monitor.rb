class ApiMonitor
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
    self.last_max= @@max
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
    @@max = client.max_item.to_i
  end

  def self.last_max
    return ENV['API_MONITOR_LAST_MAX'].to_i unless ENV['API_MONITOR_LAST_MAX'].nil?
    ENV['API_MONITOR_LAST_MAX'] = client.max_item
    ENV['API_MONITOR_LAST_MAX'].to_i
  end

  def self.last_max= new_value
    ENV['API_MONITOR_LAST_MAX'] = new_value.to_s
    return
  end
end
