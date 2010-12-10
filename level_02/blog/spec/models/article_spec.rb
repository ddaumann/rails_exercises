require 'spec_helper'

describe Article do
  it "validates uniqueness of title" do
    Article.create!(:title => "Dup!")
    article = Article.new(:title => "Dup!")
    article.should_not be_valid
    article.should have(1).error_on :title
    article.title = "No dup"
    article.should be_valid
  end

  it "validates presence of title" do
    article = Article.new
    article.should_not be_valid
    article.should have(1).error_on :title
  end
end
