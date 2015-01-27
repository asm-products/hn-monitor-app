desc 'This task is called by Heroku Scheduler to update HN'
task :api_monitor => :environment do
  ApiMonitor.fetch_stories
end