# A product should be an object created from a class. Each category should be its own type. Each product should have the base properties of:
# name
# quantity
# serial number
# cost
# sell price
# Other features to think about:
# Add "sell by" dates to each product
# 	-Have it so the manager can see how many items need to be sold within the week.
# 	-List it out by product.

class Product
	attr_accessor :name, :category, :quantity, :cost, :sell_price, :serial_number

	def initialize(name, category, serial_number, quantity, cost, sell_price)
		@name = name
		@quantity = quantity
		@serial_number = serial_number
		@cost = cost
		@sell_price = sell_price
	end	

	def change_name(new_name)
		@name = new_name
	end	

	def change_category(new_category)
		@category = new_category
	end	

	def change_quantity(new_quantity)
		@quantity = new_quantity
	end	

	def change_cost(new_cost)
		@cost = new_cost
	end	

	def change_sell_price(new_sell_price)
		@sell_price = new_sell_price
	end	
end	

# class Category
# 	attr_accessor :name
	
# 	def initialize(name)
# 		@name = name
# 	end	

# 	# def list

# 	# end	
# end	