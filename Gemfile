source 'https://rubygems.org'

ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use foreman for configuration
gem 'foreman'

# Use PostgreSQL as the database for Active Record
gem 'pg'

# Use HAML for layout
gem 'haml-rails'

# Use SASS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# That's right, I'm gonna use Bootstrap
gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails',
                              :github => 'anjlab/bootstrap-rails',
                              :branch => '3.0.0'

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

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Use cheapskate for bridging th HTTP/HTTPS divide during login & registration
gem 'cheapskate', '>= 0.0.2'

group :production do
  gem 'rails_12factor'
end

group :development do
  gem 'debugger'
  gem 'query_diet', :github => 'dtao/query_diet'
end

group :test do
  gem 'rspec-rails', '~> 2.0'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# Use thin as the app server
gem 'thin'
