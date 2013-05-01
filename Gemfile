source 'http://rubygems.org'

gem 'rails', '3.2.10'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

platforms :jruby do
  gem 'activerecord-jdbcsqlite3-adapter'
  gem 'activerecord-jdbcpostgresql-adapter'
  gem 'activerecord-oracle_enhanced-adapter'

  gem 'jruby-openssl'

  # poi wrapper
  gem 'jruby-poi', :git => 'git://github.com/chuanghs/jruby-poi.git' # use my personal modification

  # deploy on javaee app server
  gem 'warbler'
end


# Gems used only for assets and not required in production environments by default
group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'compass-rails'
  gem 'coffe-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyrhino'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem 'nested_scaffold'

# security (handling authority)
gem 'authority'

group :test, :development do
end


group :development do
  gem 'guard'
  gem 'guard-rails'
  gem 'guard-sass'
  gem 'guard-livereload'

  # using test
#  gem 'guard-test'
  # using rspec
  gem 'guard-rspec'

  # guard notification 
  gem 'terminal-notifier-guard'
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false

end

group :test do
  gem 'simplecov'

  #using test
 # gem 'mocha', '=0.12.1', :require => false  # fix on 0.12.1, 0.13 not work

  #using rspec
  gem 'rspec-rails', '~> 2.0'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  
end


# xml handling
gem 'nokogiri'

# Paginator
# gem "kaminari"
# gem 'will_paginate', '3.0.pre2'

# File Uploads
# gem 'paperclip'
# gem 'carrierwave'

# gem 'devise', '~> 1.1.7'
# gem "cancan"
# gem "simple_form"
# gem 'fastercsv' # for Ruby 1.8.7+
# gem 'prawn'
# gem "haml"
# gem "haml-rails"
# gem 'validates_timeliness', '~> 3.0.5'
# gem 'acts-as-taggable-on'
 
# gem 'hoptoad_notifier'
# gem 'newrelic_rpm'

# State machine
# gem 'aasm'
# gem 'state_machine'

# HTTP client
# gem 'typhoeus'
# gem 'rest-client', :require => 'restclient'

# Memcached client 
# gem "dalli"
# gem "memcache-client", :require => "memcache"

# Deployment tool
# gem 'capistrano'
# gem 'whiskey_disk'

# Debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19'

# Background Processing
# gem 'delayed_job'
# gem 'resque'

# Full-text search engine
# gem 'thinking-sphinx', '~> 2.0.2', :require => 'thinking_sphinx'
