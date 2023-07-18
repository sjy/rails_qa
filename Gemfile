source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.4"

gem "active_type"
gem "bcrypt"
gem "bootsnap", require: false
gem "csv"
gem "devise"
gem "good_migrations"
gem "kaminari"
gem "pg", "~> 1.1"
gem "pgcli-rails"
gem "puma", "~> 5.0"
gem "pundit", require: true
gem "rack-canonical-host"
gem "rails", "~> 7.0.6"
gem "stimulus-rails"
gem "turbo-rails"
gem "vite_rails"
gem "foreman"

group :production do
  gem "postmark-rails"
  gem "sidekiq"
end

group :development do
  gem "annotate"
  gem "brakeman", require: false
  gem "bundler-audit", require: false
  gem "erb_lint", require: false
  gem "letter_opener"
  gem "rubocop", require: false
  gem "rubocop-capybara", require: false
  gem "rubocop-factory_bot", require: false
  gem "rubocop-minitest", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "web-console"
end

group :development, :test do
  gem "byebug"
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "launchy"
end

group :test do
  gem "capybara"
  gem "capybara-lockstep"
  gem "minitest-ci", require: false
  gem "selenium-webdriver"
  gem "shoulda-context"
  gem "shoulda-matchers"
  gem "webdrivers"
end
