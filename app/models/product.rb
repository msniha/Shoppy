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

class Product < ActiveRecord::Base
	attr_accessible :name, :description, :price
	
	validates :name,  			:presence => true,
													:length 	=> { :maximum => 30 }

	validates :description, :presence => true,
													:length 	=> { :maximum => 500 }
	
	validates :price, 			:presence => true

end
