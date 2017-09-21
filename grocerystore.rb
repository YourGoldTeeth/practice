require_relative 'groceryclasses'

@categories = []
@products = []


# ***********
# home screen
# ***********

def home_screen
	puts "Welcome to the Grocery Store home Screen."
	puts "Select number of what would you like to do?"
	puts "--------------------------"
	# View Categories of products --- # Each category by default should contain 5 items.
	puts "1. View Categories"
	# View an individual product
	puts "2. View Invidual Products"
	# puts "3. Create Category"
	puts "3. Create Product"
	# Add products to any category.
	# Change the quantity of a product
	puts "4. Manage Inventory"
	puts "5. Manager Options"
	puts "6. Exit"

	entry = gets.chomp.to_i

	case entry
	when 1
		view_category
		# puts "Entry 1"
	when 2
		view_products
		puts "Entry 2"
	# when 3
	# 	system "clear"
	# 	# create_category
	# 	# puts "Entry 3"
	when 3
		create_product
		# puts "Entry 4"
	when 4
		puts "Entry 4"
		# manage_inventory	
	when 5
		puts "Entry 5"
		# manager_options
	when 6
		abort("bye")
	else 
		system "clear"
		puts "Invalid Entry"
		home_screen						
	end	
end	


def create_product
# **prompt user for info
	puts "Enter a name for the product." 
	print "Type 'Home' to go back to the home screen: "
	name = gets.chomp.downcase

# give user option to jump to welcome screen
	if name == "home"
		system "clear"
		home_screen	
	end			
# check if product already exits in db (@products array at top of page) if it does ask for product name again
	@products.each do |product|
		if name == product.name
			puts "Product already exits. Try again."
			create_product
		end	
	end
# add products to products array
	@products.push(name)

	puts "What category does this product go into?"
	category = gets.chomp

	@categories.each do |section|
		if category =! section.category
			puts "New category created."
			@categories.push(category)
		end	
	end
	product = Product.new(name, category, (@products.length + 1), 0, 0, 0)

	puts "Product #{name} was created and placed into the #{category} category with a serial number of #{product.serial_number}."

	home_screen
end	

def view_category
	system "clear"
	puts "Here's your categories."
	@categories.each_with_index do |cat, index|
		puts "#{index} #{cat}"
	end	
	home_screen
end	

home_screen



# def create_category
# 	puts "Enter a name for the category." 
# 	print "Type 'Home' to go back to the home screen: "
# 	name = gets.chomp.downcase

# 	if name == "home"
# 		system "clear"
# 		home_screen	
# 	end	
# 	category_exists = false	
# 	@categories.each do |category|
# 		if name == category.name
# 			@current_category = name
# 			category_exists = true
# 		end		
# 	end	

# 	if category_exists
# 		newcategory = Category.new(name)
# 		catergories.push(newcategory)
# 		puts "Category added. Here are you current categories:"
# 		puts categories
# 	else
# 		"Sorry this category already exists."
# 		create_category
# 	end		
# end	
