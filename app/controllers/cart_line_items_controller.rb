class CartLineItemsController < ApplicationController
	def index
		@cart_line_items = current_user.cart_line_items
		@wish_list = WishList.new
		@order = Order.new
	end
def create
	# creates an cart_line_time to an user
@cart_line_item = CartLineItem.new(params[:cart_line_item].permit(:quantity, :product_id))# create an instant variable and permits the hash with some  values like quantity and permit
@cart_line_item.user_id = current_user.id# checks the model user id and current userid who is logged in

if @cart_line_item.save_or_update # it matches saves in the database 
redirect_to cart_line_items_path, notice: "successfully added product to the cart" #and redirects to same page and gives message is displayed successfully added to the cart
end
end
def update
	@cart_line_item = CartLineItem.find(params[:id])
	if @cart_line_item.update_attributes(params[:cart_line_item].permit(:quantity))
		redirect_to cart_line_items_path, notice: "Successfully update the quantity of the product"
	end
end
def destroy
	@cart_line_item = CartLineItem.find(params[:id])
  @cart_line_item.destroy
 redirect_to cart_line_items_path, notice: "cart line item has removed"
end
end