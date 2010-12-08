require "spec_helper"

describe "articles/index.html.haml" do
  before do
    @articles = [
      mock_model(Article, {:title => "Foo"}),
      mock_model(Article, {:title => "Bar"})
    ]
  end

  it "renders the article titles" do
    render
    rendered.should contain("Foo")
    rendered.should contain("Bar")
  end

  it "renders the titles as links to the article show pages" do
    render
    rendered.should have_selector("a", :href => article_path(@articles[0]), :content => "Foo")
    rendered.should have_selector("a", :href => article_path(@articles[1]), :content => "Bar")
  end
  
  
end
