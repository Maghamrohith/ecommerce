require 'faker'
10.times do
	category_params ={"name" => Faker::Commerce.department(1)}
	category = Category.new(category_params)
	category.save
end

100.times do
	product = Product.new({"name" => Faker::Commerce.product_name, "price" => Faker::Commerce.price(10..1000), "description" => Faker::Lorem.sentence,"category_id" =>Category.all.sample.id })
	product.save
end

#200.times do
#	review = Review.new({"product_id" => Product.all.sample.id,"user_id"=>user.all.sample.id,"body" => Faker::Lorem.sentance})
#review.save
#end