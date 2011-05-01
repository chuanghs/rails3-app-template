# remove files
run "rm README"
run "rm public/index.html"
run "rm public/images/rails.png"
run "cp config/database.yml config/database.yml.example"

# install gems
run "rm Gemfile"
file 'Gemfile', File.read("#{File.dirname(rails_template)}/GemFile")

#bundle install
run "bundle install"

# copy files"
file "scripts/watchr.rb", File.read("#{File.dirname(rails_template)}/watchr.rb")
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
