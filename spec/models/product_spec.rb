# == Schema Information
#
# Table name: products
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  price       :decimal(, )
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Product do

  before(:each) do
		@attr = { 
			:name 				=> "Example Product",
			:description 	=> "Some words to describe the Product",
			:price				=> 1.23
			}
	end

	it "should create a new instance given valid attributes" do
		Product.create!(@attr)
	end

	it "should require a name" do
		no_name_product = Product.new(@attr.merge(:name => ""))
		no_name_product.should_not be_valid
	end
	
	it "should require a description" do
		no_description_product = Product.new(@attr.merge(:description => ""))
		no_description_product.should_not be_valid
	end
	
	it "should reject names that are too long" do
    long_name = "a" * 31
    long_name_product = Product.new(@attr.merge(:name => long_name))
    long_name_product.should_not be_valid
  end
  
  it "should reject descriptions that are too long" do
    long_description = "a" * 501
    long_description_product = Product.new(@attr.merge(:description => long_description))
    long_description_product.should_not be_valid
  end
end
