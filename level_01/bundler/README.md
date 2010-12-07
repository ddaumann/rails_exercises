# Rails 3 and Bundler

Bundler makes managing the gem dependencies for you rails app really easy.

## General workflow

After you have created a new rails app with  
`rails new [yourapp]`

You will have a Gemfile among other things in your new project's folder.
Here you can specify which gems you will need in your rails app.

* Add gems to Gemfile
* run `bundle install`

### Adding a gem to your rails app

in the __Gemfile__ :

`gem "gem name", "version", [options]`

For example, you would like to use haml in your app:

`gem "haml". ">=3.0.0"`

Without any version number, bundler will try to install the latest stable version.

### requiring a library that has a different name than the gem

`gem "sqlite-ruby", :require => "sqlite"`

### Installing gems for specific environments only

    group :test do
      gem "rspec"
    end

### update gems

`bundle update`

will update your gems to the newest version.
