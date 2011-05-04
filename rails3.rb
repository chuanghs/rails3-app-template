# remove files
run "rm README"
run "rm public/index.html"
run "rm public/images/rails.png"

# avoid mysql2 option for Rails3
if options[:database] =~/mysql/
  gsub_file "config/database.yml", /mysql2/, 'mysql'
end

#Add comments to config/database
file = "config/database.yml"

comment = <<COMMENTS
# If you are using derby, hsqldb, h2 or mssql with one of the ActiveRecord
# JDBC adapters, configure your database setting as the example below:
#
#development:
#  adapter: mssql
#  username: <username>
#  password: <password>
#  hostname: localhost
#  database: dummy

# If you are using oracle, db2, sybase, informix or prefer to use the plain
# JDBC adapter, configure your database setting as the example below (requires
# you to download and manually install the database vendor's JDBC driver .jar
# file). See your driver documentation for the apropriate driver class and
# connection string:
#
#development:
#  adapter: jdbc
#  username: <username>
#  password: <password>
#  driver: com.ibm.db2.jcc.DB2Driver
#  url: jdbc:db2://localhost:5021/dummy

COMMENTS
temp = IO.read(file)
open(file, "w") {|f| f << comment << temp }
run "cp config/database.yml config/database.yml.example"

# install gems
run "rm Gemfile"
file 'Gemfile', File.read("#{File.dirname(rails_template)}/Gemfile")

#bundle install
run "bundle install"

# copy files"
file "script/watchr.rb", File.read("#{File.dirname(rails_template)}/watchr.rb")
file 'lib/tasks/dev.rake', File.read("#{File.dirname(rails_template)}/dev.rake")

# install jquery
run "curl -L http://code.jquery.com/jquery.min.js > public/javascripts/jquery.js"
run "curl -L http://github.com/rails/jquery-ujs/raw/master/src/rails.js > public/javascripts/rails.js"

gsub_file 'config/application.rb', /(config.action_view.javascript_extensions.*)/,
                                   "config.action_view.javascript_extensions[:defaults] = %w(jquery rails)"

# add time format
environment 'Time::DEFAULT_FORMAT.merge!(:default => "%Y/%m/%d %I:%M %p", :ymd = "%Y/%m/%d")'

#.gitignore
append_file '.gitignore', <<-CODE
config/database.yml
Thumbs.db
.DS_Store
tmp/*
*~
CODE


# keep time and log
run "touch tmp/.gitkeep"
run "touch log/.gitkeep"

#git commit
git :init
git :add => '.'
git :add => 'tmp/.gitkeep -f'
git :add => 'log/.gitkeep -f'
git :commit => "-a -m 'initial commit'"
