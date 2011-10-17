class ProductsController < ApplicationController

	def show
		@product = Product.find(params[:id])
		@title = @product.name
	end

  def new
  	@product = Product.new
  	@title = "Add Product"
  end

	def create
		@product = Product.new(params[:product])
		if @product.save
			redirect_to @product
		else
			@title = "Add Product"
			render 'new'
		end
	end
	
end
