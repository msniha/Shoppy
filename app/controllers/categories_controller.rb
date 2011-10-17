class CategoriesController < ApplicationController

	def show
		@category = Category.find(params[:id])
		@title = @category.name
	end
	
  def new
		@category = Category.new
  	@title = "Add Category"
  end
  
  def create
		@category = Category.new(params[:category])
		if @category.save
			redirect_to @category
		else
			@title = "Add category"
			render 'new'
		end
	end

end
