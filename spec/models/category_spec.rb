require 'spec_helper'

describe Category do
  
  before(:each) do
    @attr = {
    	:name 			 => "Example Category",
    	:description => "Some words to fill the descrption"
    }
  end
  
  it "should create a new instance given valid attributes" do
		Category.create!(@attr)
	end
	
	it "should require a name" do
		no_name_category = Category.new(@attr.merge(:name => ""))
		no_name_category.should_not be_valid
	end

	it "should require a description" do
		no_description_category = Category.new(@attr.merge(:description => ""))
		no_description_category.should_not be_valid
	end
	
	it "should reject names that are too long" do
    long_name = "a" * 31
    long_name_category = Category.new(@attr.merge(:name => long_name))
    long_name_category.should_not be_valid
  end
  
  it "should reject descriptions that are too long" do
    long_description = "a" * 181
    long_description_category = Category.new(@attr.merge(:description => long_description))
    long_description_category.should_not be_valid
  end
  
  it "should reject duplicate category name" do
		# Put a category with given name into the database.
		Category.create!(@attr)
		category_with_duplicate_name = Category.new(@attr)
		category_with_duplicate_name.should_not be_valid
	end

	it "should reject category name identical up to case" do
		upcased_name = @attr[:name].upcase
		Category.create!(@attr.merge(:name => upcased_name))
		category_with_duplicate_name = Category.new(@attr)
		category_with_duplicate_name.should_not be_valid
	end

end

# == Schema Information
#
# Table name: categories
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

