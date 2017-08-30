class OrdersController < ApplicationController

def index
	@orders = current_user.orders
end
def create
	@order = Order.new(params[:order].permit(:address_id))
	@order.order_date= Date.today 
	@order.user_id = current_user.id
	@order.order_number = "Order.no#{Random.rand(1000)}"
	@order.save
	Notification.order_confirmation(@order).deliver!
	redirect_to orders_path, notice: "Your order has been placed"
end

end

