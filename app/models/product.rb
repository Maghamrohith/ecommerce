class Product < ActiveRecord::Base
	belongs_to :category
	has_one :wish_list
	has_many :order_line_items
	has_many :cart_line_items
	has_many :reviews
	validates_presence_of :name, :price, :category_id,:description
	validates_numericality_of :price,greater_than_or_equal: 1
end
