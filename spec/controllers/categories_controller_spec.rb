require 'spec_helper'

describe CategoriesController do
	render_views
	
	describe "GET 'show'" do
		
		before(:each) do
			@category = Factory(:category)
		end

		it "should be successful" do
			get :show, :id => @category
			response.should be_success
		end

			it "should find the right category" do
			get :show, :id => @category
			assigns(:category).should == @category
		end
		
		it "should have the right title" do
			get :show, :id => @category
			response.should have_selector("title", :content => @category.name)
		end
	end

  describe "GET 'new'" do
  
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  
			it "should have the right title" do
			get 'new'
			response.should have_selector("title", :content => "Add Category")
		end
	end
	
	describe "POST 'create'" do

    describe "failure" do

      before(:each) do
        @attr = { :name => "", :description => ""}
      end

      it "should not create a category" do
        lambda do
          post :create, :category => @attr
        end.should_not change(Category, :count)
      end

      it "should render the 'new' page" do
        post :create, :category => @attr
        response.should render_template('new')
      end
    end
    
    describe "success" do

      before(:each) do
        @attr = { :name => "New Category", :description => "New category's description"}
      end

      it "should create a category" do
        lambda do
          post :create, :category => @attr
        end.should change(Category, :count).by(1)
      end
      
      it "should redirect to the category show page" do
        post :create, :category => @attr
        response.should redirect_to(category_path(assigns(:category)))
      end    
    end
  end
end
