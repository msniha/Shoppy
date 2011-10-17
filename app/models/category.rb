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

class Category < ActiveRecord::Base
	attr_accessible :name, :description
	
	validates :name, 				:presence 	=> true,
													:length 	 	=> { :maximum => 30 },
													:uniqueness => { :case_sensitive => false }

	validates :description, :presence => true,
													:length 	 	=> { :maximum => 180 }
end

