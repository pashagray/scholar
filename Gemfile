source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'slim'
gem 'bootstrap', '~> 4.0.0.beta3'
gem 'jquery-rails'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'devise'
gem 'wisper', '2.0.0'
gem 'active_link_to'
gem 'momentjs-rails'
gem 'bootstrap-daterangepicker-rails'
gem 'gretel', github: '44uk/gretel', branch: 'support-bootstrap4-alpha'
gem 'font-awesome-rails'
gem 'paranoia', '~> 2.2'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'rails-settings-cached'
gem 'dry-transaction'
gem 'mini_magick'
gem 'carrierwave', '~> 1.0'
gem 'react-rails'
gem 'petrovich', '~> 1.0'
gem 'therubyracer'
gem 'activity_notification'
gem 'fog-aws'
gem 'redis', '~> 3.0'
gem 'sidekiq'
gem 'newrelic_rpm'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rvm', require: false
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
