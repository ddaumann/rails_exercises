# Create a blog using BDD

The classic Rails app done BDD-style!

## Steps

### Setup

We don't want the Test::Unit stuff (-T)  
`rails new blog -T`

Add BDD-related gems to Gemfile and `bundle`

    rails generate rspec:install
    rails generate cucumber:install --rspec --capybara

Comment out line 19 in features/support/env.rb to patch the capybara glitch on "follow"

Config for autotest: `config/cucumber.yml`

    autotest: --format pretty --color
    autotest-all: --format progress --color

### Starting the outside-in cycle

1. Create a feature `features/browse_articles.feature`
