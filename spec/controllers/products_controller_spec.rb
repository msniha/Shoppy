require 'spec_helper'

describe ProductsController do
	render_views

  describe "GET 'show'" do
  
    before(:each) do
			@product = Factory(:product)
		end

		it "should be successful" do
			get :show, :id => @product
			response.should be_success
		end

			it "should find the right product" do
			get :show, :id => @product
			assigns(:product).should == @product
		end
		
		it "should have the right title" do
			get :show, :id => @product
			response.should have_selector("title", :content => @product.name)
		end
	end
	
	describe "GET 'new'" do
  
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  
			it "should have the right title" do
			get 'new'
			response.should have_selector("title", :content => "Add Product")
		end
	end
	
	describe "POST 'create'" do

    describe "failure" do

      before(:each) do
        @attr = { :name => "",
        					:description => "",
        					:price => ""
        				}
      end

      it "should not create a product" do
        lambda do
          post :create, :product => @attr
        end.should_not change(Product, :count)
      end

      it "should render the 'new' page" do
        post :create, :product => @attr
        response.should render_template('new')
      end
    end
    
    describe "success" do

      before(:each) do
        @attr = { :name => "New Product",
        					:description => "New product's description",
        					:price => 1.23
        				}
      end

      it "should create a product" do
        lambda do
          post :create, :product => @attr
        end.should change(Product, :count).by(1)
      end
      
      it "should redirect to the product show page" do
        post :create, :product => @attr
        response.should redirect_to(product_path(assigns(:product)))
      end    
    end
  end
end
