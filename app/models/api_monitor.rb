class ApiMonitor
  CLIENT = HackernewsRuby::Client.new

  def self.fetch_stories
    CLIENT.top_stories.each do |story|
      response = CLIENT.get_item(story)

      # TODO determine how we want to store each story
    end
  end
end
