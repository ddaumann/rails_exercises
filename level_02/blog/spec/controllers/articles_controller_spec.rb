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

  context "DELETE destroy" do
    before { Article.stub(:find) { mock_article }}

    it "redirects to articles page" do
      delete :destroy, :id => 42
      response.should redirect_to articles_url
    end
    
    it "assigns the requested article as @article" do
      delete :destroy, :id => 42
      assigns[:article].should == mock_article
    end
    
    it "destroys the requested article" do
      mock_article.should_receive :destroy
      delete :destroy, :id => 42
    end
    
    it "sets the proper notice" do
      delete :destroy, :id => 42
      flash[:notice].should == "Article has been successfully destroyed!"
    end
  end

  context "GET edit" do
    before { Article.stub(:find) { mock_article} }
    
    it "assigns the requested article as @article" do
      get :edit, :id => 42
      assigns[:article].should == mock_article
    end
  end

  context "PUT update" do

    it "assigns the requested article as @article" do
      Article.stub(:find).with(42) { mock_article }
      put :update, :id => 42
      assigns[:article].should == mock_article
    end
    
    context "with valid attributes" do
      before { Article.stub(:find) { mock_article(:update_attributes => true) } }

      it "redirects to article show page" do
        put :update, :id => 42
        response.should redirect_to article_url(@article)
      end

      it "updates @article" do
        mock_article.should_receive(:update_attributes)
        put :update, :id => 42
      end
      
      it "sets the proper notice" do
        put :update, :id => 42
        flash[:notice].should == "Successfully updated article!"
      end
      
    end

    context "with invalid attributes" do
      before { Article.stub(:find) { mock_article(:update_attributes => false) } }

      it "re-renders the edit form" do
        put :update, :id => 42
        response.should render_template "edit"
      end
      
    end
  end
end
