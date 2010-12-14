Given /^an article with the title "([^"]*)"$/ do |title|
  Article.create!(:title => title)
end

Given /^an article with the title "([^"]*)" and the content "([^"]*)"$/ do |title, content|
  Article.create!(:title => title, :content => content)
end

Given /^there is no article with the title "([^"]*)"$/ do |article|
  Article.find_by_title(article).should_not == true
end

Then /^I should see "([^"]*)" on the articles list$/ do |title|
  visit articles_url
  page.should have_content title
end

Then /^I should not see "([^"]*)" on the articles list$/ do |title|
  visit articles_url
  page.should_not have_content title
end

