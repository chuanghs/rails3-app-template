namespace :dev do
  
  desc "Rebuild the system"
  task :build => ["temp:clean", "log:clean", "db:reset", "db:setup"]

  desc "Generate fake data"
  task :fake => :environment do
    # TODO
  end

  desc "Run watchr"
  task :watchr do
    system "bundle exec watchr script/watchr.rb")
  end
end
