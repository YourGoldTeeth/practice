# def not_integer

print "Integer please: " 
user_num=Integer(gets) rescue false

if user_num == false
    puts "please enter an integer"
else	
	puts "thnx for integer"
end

