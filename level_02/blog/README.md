# Create a blog using BDD

The classic Rails app done BDD-style!

## Workflow

### Setup

* We don't want the Test::Unit stuff (-T)  
`rails new blog -T`

* Add BDD-related gems to Gemfile and `bundle`

    rails generate rspec:install
    rails generate cucumber:install --rspec --capybara

* Comment out line 19 in features/support/env.rb to patch the capybara glitch on "follow"

* Config for autotest: `config/cucumber.yml`

    autotest: --format pretty --color
    autotest-all: --format progress --color

### Starting the outside-in cycle

__Cucumber__

* Create a feature `features/browse_articles.feature`

* Implement undefined step in `features/step_definitions/blog_steps.rb`

* Create model Article `rails g model article title:string`

* migrate database `rake db:migrate; rake db:test:prepare`

* Add articles resource to the routes

* Add articles controller

__RSpec__ time!  
First example: articles/index

* spec index action
* create index action
* create empty index view template and empty view test

* drive out the index view with rspec

#### first scenario is complete, on to the next one

#### Scenario: Reading an article

__Cucumber__

* add scenario to `features/browse_articles.feature`

* add step definition "Given an article with the title [...] and the content [...]

* new migration to add content(text) to article. Migrate test and development.

__Rspec__

* Drive out some more behaviour for the index view: the titles should be links to the articles

* Drive out show action with RSpec, create empty view template

* Drive out view template for show

#### second scenario and the first feature are complete

### Feature: administer articles

#### Scenario: Adding articles

__Cucumber__

* Write feature: `features/admin_articles.feature`

* Add missing step_definitions and path definitions

__RSpec__

* Drive out articles/index view: Add articles link

* Drive out "new" action at the articles controller

* Drive out form for new template

* Drive out create action in articles controller

__Cucumber__

* Add new path mapping to `features/support/paths.rb`

__Scenario passes__

##### Scenario: Trying to add an article with a duplicate title

* Write a new scenario: `features/admin_articles.feature`

__RSpec__

* Drive out validation (uniqueness of title) in the model

__Scenario passes__

##### Scenario: Trying to add an article without a title

__Cucumber__

* Write a new scenario: `features/admin_articles.feature`

__RSpec__

* Drive out validation (presence_of) for title in the model

__Scenario passes__

__Cucumber__

* Write a new scenario to delete an article

__RSpec__

* Drive out destroy link in the show template

* Drive out destroy action in articles controller

__Scenario passes__

__Cucumber__

* Write new scenario: Edit an article

* add missing step defintion

__RSpec__

* drive out edit button

* drive out edit action

* drive out edit template

* drive out update action

__Scenario passes__
