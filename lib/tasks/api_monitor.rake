desc 'This task is called by Heroku Scheduler to update HN'
task :api_monitor => :environment do
  puts 'fetching new stories'
  ApiMonitor.fetch_stories
  puts 'done'
end