source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'active_link_to'
gem 'activity_notification'
gem 'bootstrap', '~> 4.0.0.beta3'
gem 'bootstrap-daterangepicker-rails'
gem 'carrierwave', '~> 1.0'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'dry-transaction'
gem 'fog-aws'
gem 'font-awesome-rails'
gem 'gretel', github: '44uk/gretel', branch: 'support-bootstrap4-alpha'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'mini_magick'
gem 'momentjs-rails'
gem 'paranoia', '~> 2.2'
gem 'petrovich', '~> 1.0'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.4'
gem 'rails-settings-cached'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'react-rails'
gem 'redis'
gem 'rmagick'
gem 'sass-rails', '~> 5.0'
gem 'slim'
gem 'therubyracer'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'wisper', '2.0.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_girl_rails'
  gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rubocop'
end

group :test do
  gem 'capybara'
  gem 'capybara-email'
  gem 'capybara-screenshot'
  # gem 'chromedriver-helper'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'capybara-webkit'
  gem 'selenium-webdriver'
  # gem 'shoulda-matchers'
end

group :development do
  gem 'capistrano', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rvm', require: false
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
