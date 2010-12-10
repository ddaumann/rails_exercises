require "spec_helper"

describe "articles/new.html.haml" do
  before do
    @article = mock_model(Article).as_new_record.as_null_object
  end

  it "renders a form for @article" do
    render
    rendered.should have_selector("form", :action => articles_path, :method => "post") do |form|
      form.should have_selector("input", :value => "Submit")
    end
  end

  it "renders a title field" do
    render
    rendered.should have_selector("form") do |form|
      form.should have_selector("label", :content => "Title")
      form.should have_selector("input", :type => "text", :name => "article[title]")
    end
  end
  
  it "renders a content textarea" do
    render
    rendered.should have_selector("form") do |form|
      form.should have_selector("label", :content => "Content")
      form.should have_selector("textarea", :name => "article[content]")
    end
  end
  
end
