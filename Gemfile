source "https://rubygems.org"

# Declare your gem's dependencies in user_frame.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
gem 'rails', '4.1'
gem 'mysql2'#, '0.3.11'
# Use sqlite3 as the database for Active Record

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

gem "bcrypt-ruby", "~> 3.1.2"


gem "therubyracer"
gem "less-rails"
gem "twitter-bootstrap-rails"

# gem 'devise'
# gem 'activeadmin', github: 'gregbell/active_admin'

group :development do
  # gem 'guard'
  # gem 'guard-rspec', require: false
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'spork-rails', '~> 4.0.0'
  gem 'guard-spork'
  gem 'childprocess'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :test, :development do
  gem "rspec-rails"
  gem "factory_girl", '>= 4.3'
  gem "factory_girl_rails", '>= 4.3'
  gem 'perftools.rb', require: 'perftools'
end