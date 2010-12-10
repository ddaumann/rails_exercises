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

  context "POST create" do
    it "assigns the posted article to @article" do
      Article.stub(:new) { mock_article }
      post :create
      assigns[:article].should == mock_article
    end

    context "with valid attributes" do
      before { Article.stub(:new) { mock_article(:save => true) } }

      it "saves article" do
        mock_article.should_receive(:save)
        post :create
      end
      
      it "redirects to article show page" do
        post :create
        response.should redirect_to article_url(mock_article)
      end
      
      it "sets a positive notice" do
        post :create
        flash[:notice].should == "Article saved successfully!"
      end
      
    end

    context "with invalid attributes" do
      before { Article.stub(:new) { mock_article(:save => false) } }

      it "re-renders new template" do
        post :create
        response.should render_template "new"
      end
    end
  end

end
