class Address < ActiveRecord::Base

	belongs_to :user
	has_many :orders
	#validates_presence_of :user_id, :street,:pin, :city, :landmark
	#validates_numericality_of :user_id, :pin
	#validates_length_of :pin, is:6
end
