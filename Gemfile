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

# Ze tests
group :test do
  gem 'rspec'
  gem 'rack-test'
  gem 'database_cleaner'
end

# Let me debug
gem 'byebug', group: [:development, :test]
