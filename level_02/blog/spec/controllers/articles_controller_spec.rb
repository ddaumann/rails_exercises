require 'spec_helper'


describe ArticlesController do

  def mock_article(stubs = {})
    @article ||= mock_model(Article, stubs).as_null_object
  end

  context "index" do
    it "assigns all articles to @articles" do
      Article.stub(:all) { [mock_article] }
      get :index
      assigns[:articles].should == [mock_article]
    end
    
  end
end
