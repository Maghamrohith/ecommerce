class AddressesController < ApplicationController
	def index
		@addresses = current_user.addresses
	end
	 def new
		@address = Address.new
    end

     def create
	  @address = Address.new(params[:address].permit(:user_id, :street, :pin, :city, :landmark))
	  @address.user_id = current_user.id
	  if @address.save
	  	redirect_to addresses_path, notice: "successfully added the address"
	  else
	  	render action: "new"
	  end

    end
    def show
    	@address = find(params[:id])
    end
end

