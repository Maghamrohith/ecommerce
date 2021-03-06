class ProductsController < ApplicationController
	def index
		@products = Product.all
	end
	def new
		@product = Product.new
	end
	def create
		@product = Product.new(params[:product].permit(:name,:category_id,:description,:price,:code,:stock,:cod_eligible))
		if @product.save
			redirect_to products_path, notice: "successfully created the product"
		else
			render action: "new"
		end
	end
	def show
		@product = Product.find(params[:id])
		#@category = Category.find(@product.category_id)
		@category = Category.find(@product.category_id)
		@cart_line_item = CartLineItem.new
		@review = Review.new
	end
	def edit
		@product = Product.find(params[:id])
	end
	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(params[:product].permit(:name,:category_id,:description,:price,:code,:stock,:cod_eligible))
	redirect_to product_path(@product.id),notice: "successfully update the product"
else
	render action: "edit"
	end
end

def destroy

	@product = Product.find(params[:id])
	@product.destroy
	redirect_to products_path,notice: "successfully destroyed the product"
	end

end
