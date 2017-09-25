class Product
	attr_accessor :name, :category, :quantity, :cost, :sell_price, :serial_number

	def initialize(name, category, serial_number, quantity, cost, sell_price)
		@name = name
		@category = category
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

@categories = []
@products = []

# ***********
# home screen
# ***********

def home_screen
	puts "Welcome to the Grocery Store home screen."
	puts "Select the number of what would you like to do?"
	puts "--------------------------"
	# View Categories of products --- # Each category by default should contain 5 items.
	puts "1. View Categories"
	# View an individual product
	puts "2. View Products"
	# puts "3. Create Category"
	puts "3. Create Product"
	# Add products to any category.
	# Change the quantity of a product
	puts "4. Manage Products"
	# puts "5. Manager Options"
	puts "5. Exit\n\n"

	print "Selection:"
	entry = gets.chomp.to_i

	case entry
	when 1
		view_category
		# puts "Entry 1"
	when 2
		view_product
		puts "Entry 2"
	# when 3
	# 	system "clear"
	# 	# create_category
	# 	# puts "Entry 3"
	when 3
		create_product
		# puts "Entry 4"
	when 4
		# puts "Entry 4"
		manage_inventory	
	# when 5
	# 	puts "Entry 5"
		# manager_options
	when 5
		puts "Thanks for using the Grocery Store! Bye bye!"
		abort
	else 
		system "clear"
		puts "Invalid Entry"
		home_screen						
	end	
end	

# option 1 selection, view category selection
def view_category
	system "clear"
	# puts "(Type '-1' to go to the main menu)\n\n"
	if @categories.empty?
		puts "**********************"
		puts "No categories created."
		puts "**********************\n\n"
		puts "Go back to the main menu by typing -1 and select option '3' to create a product with a category.\n\n"
	else	
		puts "Here's your categories:"
		@categories.each_with_index do |cat, index|
		puts "#{index} #{cat}"
		end	
	print "Type the category's serial number to view the category's products."	
	end
		
	selection = Integer(gets) rescue false

	if selection == false
	    puts "please enter an integer"
	    manage_inventory
	elsif selection == -1
		system"clear"
		home_screen
	end

	cat_selection = @categories[selection]

	system"clear"
	puts "Here's the products in that category:\n\n"
	@products.each_with_index do |prod, index|
		if cat_selection == prod.category 
			puts "#{index + 1} #{prod.name}"
		end	
	end
	puts""
	puts "Would you like to manage the inventory of this product?"
	puts "Type Y or N"
	selection = gets.chomp.downcase
	if selection == "y"
		manage_inventory
	elsif selection == "n"
		system"clear"
		home_screen
	else 
		puts "please select 'Y' or 'N'"
	end		
end	

# option 2, view products
def view_product
	system "clear"

	if @categories.empty?
		puts "********************"
		puts "No products created."
		puts "********************\n\n"
		puts "Go back to the main menu by typing 000 and select option '3' to create a product.\n\n"
	else	
		puts "Here's your products."
		@products.each_with_index do |prod, index|
		puts "#{index + 1} #{prod.name}"
		puts "(type '000' to go to the main menu)"
		print "Type the product's serial number view the product's info."
		end	
	end

	selection = Integer(gets) rescue false

	if selection == false
	    puts "please enter an integer"
	    manage_inventory
	elsif selection == 000
		system"clear"
		home_screen
	end

	product_selection = @products[selection-1]
	system"clear"
	puts "Here's that product's info:"
	puts "Name:          #{product_selection.name}"
	puts "Category:      #{product_selection.category}"
	puts "Serial Number: #{product_selection.serial_number}"
	puts "Quantity:      #{product_selection.quantity}"
	puts "Cost:         $#{'%0.2f'%product_selection.cost}"
	puts "Sell Price:   $#{'%0.2f'%product_selection.sell_price}"
	puts "***************************"

	home_screen
end

# option 3 selection create products
def create_product
# **prompt user for product name
	system"clear"
	puts "(Type 'Home' to go back to the home screen:)"
	puts "******************************************"
	print "Enter a name for the product: " 
	name = gets.chomp.downcase

# give user option to jump to welcome screen
	if name == "home"
		system "clear"
		home_screen	
	end			
# check if product already exits in db (@products array at top of page) 
# if it does ask for product name again

	if @products.include?(name) == true
		puts "Product already exits. Try again."
		create_product	
	end

# get category for product
	
	puts "What category does this product go into?"
	cat = gets.chomp.downcase

# check if category exists. if so, inform user new category is created and 
# create new Product class with product name and category info
# serial number is generated automatically and prices are automatically set to 0
	if @categories.include?(cat) == false
		puts "New category #{cat} created!"
		product = Product.new(name, cat, (@products.length + 1), 0, 0, 0)
		@products.push(product)
		@categories.push(cat)
		# puts "These are the categories #{@categories}"
	else
# if category doesn't exist, then just create new Product class with product name and category info
# serial number is geneated automatically and prices are automatically set to 0
		product = Product.new(name, cat, (@products.length + 1), 0, 0, 0)
		@products.push(product)
	end
# inform the user that the product has been created with the category and also inform the serial number.	
	# system "clear"
	system"clear"
	puts "Product #{name} was created!"
	puts "It was placed into the #{product.category} category with a serial number of: #{product.serial_number}."
	sleep(2)

	while true
	puts "Would you like to manage the inventory of this product?"
	puts "Type Y or N"
	selection = gets.chomp.downcase
		if selection == "y"
			manage_inventory
		elsif selection == "n"
			system"clear"
			home_screen
		else 
			puts "please select 'Y' or 'N'"
		end	
	end	
end	

# option 4, manage inventory
def manage_inventory
# lists out 

	system "clear"
	puts "Here's your products:"
	@products.each_with_index do |prod, index|
		puts "#{index + 1} #{prod.name}"
	end
	print "Type the product's serial number to update or type '000' to go to the main menu "
	selection = Integer(gets) rescue false

	if selection == false
	    puts "please enter an integer"
	    manage_inventory
	elsif selection == 000
		system"clear"
		home_screen
	end

	product_selection = @products[selection-1]
	
	system"clear"
	puts "You selected #{product_selection.name}"
	puts "What would you like to change for the product #{product_selection.name}?"
	puts "------------------------------"
	puts "1. Name"
	puts "2. Category"
	puts "3. Quantity"
	puts "4. Cost"
	puts "5. Sell Price"
	puts "6. Back"

	entry = gets.chomp.to_i

	case entry
	when 1
		# puts "entry 1"
		system"clear"
		print "Enter a new name for #{product_selection.name}: "
		changer = gets.chomp
		puts "Change #{product_selection.name} to #{changer}?" 
		puts "Type 'Y' to confirm. Type 'N' to cancel."
			selection = gets.chomp.downcase
			if selection == "y"
				product_selection.change_name(changer)
				manage_inventory
			elsif selection == "n"
				system"clear"
				manage_inventory
			else 
				puts "Invalid Entry'"
			end	 
	when 2
		# puts "entry 2"
		system"clear"
		puts "Enter a new category for #{product_selection.category}"
		changer = gets.chomp
		puts "Change #{product_selection.category} to #{changer}?" 
		puts "Type 'Y' to confirm. Type 'N' to cancel."
			selection = gets.chomp.downcase
			if selection == "y"
				product_selection.change_category(changer)
				manage_inventory
			elsif selection == "n"
				system"clear"
				manage_inventory
			else 
				puts "Invalid Entry'"
			end	 
	when 3
		# puts "entry 3"
		system"clear"
		puts "Enter a new quantity amount for #{product_selection.quantity}"
		changer = gets.chomp
		puts "Change quantity of #{product_selection.quantity} to #{changer}?" 
		puts "Type 'Y' to confirm. Type 'N' to cancel."
			selection = gets.chomp.downcase
			if selection == "y"
				product_selection.change_quantity(changer)
				manage_inventory
			elsif selection == "n"
				system"clear"
				manage_inventory
			else 
				puts "Invalid Entry'"
			end	 
	when 4
		# puts "entry 4"
		system"clear"
		puts "Enter a new cost amount for $#{'%0.2f'%product_selection.cost}:"
		changer = gets.chomp
		puts "Change cost of $#{'%0.2f'%product_selection.cost} to $#{'%0.2f'%changer}?" 
		puts "Type 'Y' to confirm. Type 'N' to cancel."
			selection = gets.chomp.downcase
			if selection == "y"
				product_selection.change_cost(changer)
				manage_inventory
			elsif selection == "n"
				system"clear"
				manage_inventory
			else 
				puts "Invalid Entry'"
			end	 
	when 5	
		# puts "entry 5"
		system"clear"
		puts "Enter a new sell price amount for $#{'%0.2f'%product_selection.sell_price}"
		changer = gets.chomp
		puts "Change sell price of $#{'%0.2f'%product_selection.sell_price} to $#{'%0.2f'%changer}?" 
		puts "Type 'Y' to confirm. Type 'N' to cancel."
			selection = gets.chomp.downcase
			if selection == "y"
				product_selection.change_sell_price(changer)
				manage_inventory
			elsif selection == "n"
				system"clear"
				manage_inventory
			else 
				puts "Invalid Entry'"
			end	 
	when 6
		manage_inventory	
	else 
		system "clear"
		puts "Invalid Entry. Please try again."
		manage_inventory
	end	

	home_screen
end	

system"clear"
home_screen
