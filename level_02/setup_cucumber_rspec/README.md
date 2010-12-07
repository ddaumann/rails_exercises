# Using RSpec and Cucumber in a rails 3 app

## Gemfile

Add the following to your Gemfile:

  group :test, :development do
    gem "rspec-rails"
  end

  group :test do
    gem "rspec"
    gem "webrat"
    gem "cucumber-rails"
    gem "database_cleaner"
    gem "capybara"
  end

## Install RSpec and Cucumber

`bundle install`

__RSpec:__

`rails generate rspec:install`

__Cucumber:__

`rails generate cucumber:install --rspec --capybara`

## Fix a bug in capybara

features/support/env.rb line:19 -- comment it out
