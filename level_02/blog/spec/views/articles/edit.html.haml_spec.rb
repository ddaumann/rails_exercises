require "spec_helper"

describe "articles/edit.html.haml" do
  before { @article = mock_model(Article, :title => "Foo").as_null_object }

  it "renders a form for @article" do
    render
    rendered.should have_selector("form", :action => article_path(@article), :method => "post") do |form|
      form.should have_selector("input", :type => "submit", :value => "Submit")
    end
  end

  it "renders an input field for the title" do
    render
    rendered.should have_selector("form") do |form|
      form.should have_selector("input", :type => "text", :name => "article[title]")
    end
  end
  
  it "renders a text area for the content" do
    render
    rendered.should have_selector("form") do |form|
      form.should have_selector("textarea", :name => "article[content]")
    end
  end
end
