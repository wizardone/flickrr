source 'https://rubygems.org'

# Downgrade to 1.4.7, because of "great" support for sinatra-activerecord
gem 'sinatra', '1.4.7'
gem 'sinatra-flash'

# Use thin as server
gem 'thin'

# DB layer
gem 'sinatra-activerecord', '~> 2.0'
gem 'pg'
gem 'rake'

# Views
gem 'haml'

# Flickr integration
gem 'flickr.rb'

gem 'will_paginate', '~> 3.1.1'

# Ze tests
group :test do
  gem 'rspec'
  gem 'rack-test'
  gem 'vcr'
  gem 'fakeweb'
  gem 'database_cleaner'
  gem 'codecov', require: false
end

# Let me debug
gem 'byebug', group: [:development, :test]
