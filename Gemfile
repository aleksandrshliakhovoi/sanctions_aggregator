source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'rails', '~> 6.1.4'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'pg', '~> 1.2', '>= 1.2.3'
gem 'roo', '~> 2.8.0'
gem 'kaminari', '~> 1.2', '>= 1.2.1', git: 'https://github.com/kaminari/kaminari'
gem 'sidekiq', '~>6.0.0'
gem "sidekiq-cron", "1.2.0"
gem 'searchkick', '~> 4.5', '>= 4.5.2'
gem 'typhoeus', '~> 1.4'
gem 'oj', '~> 3.13', '>= 3.13.2'
gem 'faker', '~> 2.18'
gem 'devise', '~> 4.2'
gem 'pundit', '~> 2.1', '>= 2.1.1'

group :development, :test do
  gem 'byebug', '~> 11.1', '>= 11.1.3', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails', '~> 2.7', '>= 2.7.6'
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'brakeman', '~> 5.1', '>= 5.1.1'
  gem 'bundler-audit', '~> 0.8.0'
  gem 'bundler-leak', '~> 0.2.0'
  gem 'capistrano', '~> 3.16', require: false
  gem 'capistrano-rails', '~> 1.1', '>= 1.1.7', require: false
  gem 'capistrano-rbenv', '~> 2.2'
  gem 'ed25519'
  gem 'bcrypt_pbkdf'
  gem 'database_consistency', '~> 1.1', '>= 1.1.2'
  gem 'listen', '~> 3.3'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'rubocop', '~> 1.18', '>= 1.18.4'
  gem 'rubocop-packaging', '~> 0.5.1'
  gem 'rubocop-performance', '~> 1.11', '>= 1.11.4'
  gem 'rubocop-rails', '~> 2.11', '>= 2.11.3'
  gem 'rubocop-rspec', '~> 2.4'
  gem 'solargraph', '~> 0.43.0'
  gem 'spring', '~> 2.1', '>= 2.1.1'
  gem 'web-console', '>= 4.1.0'
  gem 'lefthook', '~> 0.5.5'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'database_cleaner', '~> 2.0', '>= 2.0.1'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
  gem "fakeredis", require: "fakeredis/rspec"
  gem 'selenium-webdriver', '~> 3.142', '>= 3.142.7'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'webdrivers', '~> 4.6'
end

gem 'tzinfo-data', '~> 1.2021', '>= 1.2021.1', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
