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

2. Implement undefined step in `features/step_definitions/blog_steps.rb`

3. Create model Article `rails g model article title:string`

4. migrate database `rake db:migrate; rake db:test:prepare`

5. Add articles resource to the routes

6. Add articles controller

RSpec time!  
7. First example: articles/index

* spec index action
* create index action
* create empty index view template and empty view test

8. drive out the index view with rspec

#### first scenario is complete, on to the next one

#### Scenario: Reading an article

1. add scenario to `features/browse_articles.feature`

2. add step definition "Given an article with the title [...] and the content [...]

3. new migration to add content(text) to article. Migrate test and development.

4. Drive out some more behaviour for the index view: the titles should be links to the articles

5. Drive out show action with RSpec, create empty view template

6. Drive out view template for show

#### second scenario and the first feature are complete

#### Next: administer articles

1. Write feature: `features/admin_articles.feature`

2. Add missing step_definitions and path definitions

RSpec

3. Drive out articles/index view: Add articles link

4. Drive out "new" action at the articles controller
