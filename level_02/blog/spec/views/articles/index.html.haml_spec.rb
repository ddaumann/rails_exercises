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
  
end
