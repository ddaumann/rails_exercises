require 'spec_helper'


describe ArticlesController do

  def mock_article(stubs = {})
    @article ||= mock_model(Article, stubs).as_null_object
  end

  context "GET index" do
    it "assigns all articles to @articles" do
      Article.stub(:all) { [mock_article] }
      get :index
      assigns[:articles].should == [mock_article]
    end
  end

  context "GET show" do
    it "assigns the requested article as @article" do
      Article.stub(:find).with(42) {mock_article}
      get :show, :id => 42
      assigns[:article].should == mock_article
    end
  end

  context "GET new" do
    it "assigns a new article to @article" do
      Article.stub(:new) { mock_article }
      get :new
      assigns[:article].should == mock_article
    end
  end

end
