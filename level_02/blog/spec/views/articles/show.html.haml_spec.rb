require "spec_helper"

describe "articles/show.html.haml" do
  before do
    @article = mock_model(Article, {:title => "Foo", :content => "bar"})
  end

  it "renders the article title" do
    render
    rendered.should contain("Foo")
  end

  it "renderes the article content" do
    render
    rendered.should contain("bar")
  end

  it "renders a link back to the articles page" do
    render
    rendered.should have_selector("a", :href => articles_path, :content => "Back to articles")
  end

  it "renders a destroy link" do
    render
    rendered.should have_selector("a", :content => "Destroy")
  end
  
  
end
