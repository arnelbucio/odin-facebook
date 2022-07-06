source 'https://rubygems.org'

ruby '3.1.2'

gem 'rails', '4.1.16'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'

gem 'jquery-rails'
gem 'turbolinks'

gem 'bigdecimal', '1.4.4'

# Authentication
gem 'devise'

# Github OmniAuth
gem 'omniauth-github'

# Form builder
gem 'simple_form', '~> 3.1.0.rc2' # tag for Bootstrap 3 support

# Bootstrap
gem 'autoprefixer-rails'
gem 'bootstrap-sass', '~> 3.2.0.4'

# File uploads
gem 'carrierwave'

# ImageMagick wrapper
gem 'mini_magick'

# Pagination
gem 'kaminari'

# jQuery Timeago helper
gem 'rails-timeago'

# AJAX file uploads
gem 'remotipart', '~> 1.2.1'

# App config
gem 'figaro', '~> 1.0'


group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'rack-mini-profiler'
end

group :development do
  gem 'spring-commands-rspec'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets'
  gem 'bullet'
end

group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'shoulda-matchers', require: false
end

group :production do
  gem 'rails_12factor'
  gem 'postmark-rails' # Transactional emails
end
