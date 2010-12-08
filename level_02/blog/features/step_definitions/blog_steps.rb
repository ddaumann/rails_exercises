Given /^an article with the title "([^"]*)"$/ do |title|
  Article.create!(:title => title)
end

Given /^an article with the title "([^"]*)" and the content "([^"]*)"$/ do |title, content|
  Article.create!(:title => title, :content => content)
end


