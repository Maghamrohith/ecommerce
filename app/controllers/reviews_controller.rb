class ReviewsController < ApplicationController
	def index
		@reviews = current_user.reviews
	end
	def create
		@review = Review.new(review_params)
		@review.user_id = current_user.id
		if @review.save
			 Notification.review_confirmation(@review).deliver!
			redirect_to :back, notice: "successfully created review"
		end
	end

	def review_params
		params.require(:review).permit(:product_id,:user_id,:body,:rating)
	end
end
