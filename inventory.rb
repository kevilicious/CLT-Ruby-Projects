class Inventory

def initialize
	puts "Welcome to the Video Game Inventory Program. Please be aware that when inputing anything is case sensitive!"
	initial_items
end

def inventory_list
	
@inventorylist.each do |key, value|

		puts "\n#{key}"

	end

end

def initial_items
	@inventorylist = {"Witcher 3" => 10, "Dragon Age: Origins" => 5, "Dragon Age II" => 8, "Dragon Age Inquisition" => 2}


	puts "\nHere is a list of all video games in our inventory."

	inventory_list

	do_next	

end

def do_next
	puts "\nWhat would you like to do next? (Type the number only)."
	puts " (1) See how much of the video games are in stock."
	puts " (2) Change the amount of video games in stock."
	puts " (3) Add a game to stock."
	puts " (4) Delete a game in stock."
	puts " (5) Change a game name in stock."
	puts " (6) See full inventory."
	puts " (7) Exit program.\n"
	answer = gets.chomp.to_s

	get_count if answer == '1'
	change_count if answer == '2'
	add_item if answer == '3'
    delete_item if answer == '4'
    change_item_name if answer == '5'
    full_inventory if answer == '6'
    exit_program if answer == '7'
 end 

 def get_count
 	puts "\nWhat game do you want to look up? (Case sensitive)"
 	@item = gets.chomp
 	puts "\nThere is #{@inventorylist[@item]} #{@item} in stock."
 	do_next
 end

def change_count
    puts "\nWhich game do you want to change the amount for?"
    @item = gets.chomp
    if @inventorylist.has_key?(@item)
    	puts "\nWhat's the new amount for #{@item}?"
   	 	@count = gets.chomp.to_i
   		@inventorylist[@item] = @count
    	puts "\nThere is #{@inventorylist[@item]} #{@item} in stock."
    else 
    	puts "\nPlease check your spelling."
    end
    
    do_next
end

def add_item
	puts "Please input the game name that needs to be added to stock."
	@item = gets.chomp.to_s
	puts "Please add how many of the game is being added to stock."
	@itemamount = gets.chomp.to_s
	@inventorylist[@item] = @itemamount
	puts "#{@item} has been added to stock."
	inventory_list
	do_next
end

def delete_item
   	puts "Which game do you want to delete?"
    @item = gets.chomp.to_s
    @inventorylist.delete(@item)
    puts "#{@item} has been deleted from stock."
    do_next
end

def change_item_name
    puts "Which game needs to be changed?"
    @item = gets.chomp.to_s
    puts "What is the new name?"
    new_name = gets.chomp.to_s
    @inventorylist[new_name] = @inventorylist[@item]
    @inventorylist.delete(@item)
    do_next
end

def full_inventory 
 	puts "\nHere is a list of everything in the inventory."
 	
	@inventorylist.each do |key, value|

		puts "\n" + key + ": " + value.to_s

	end

 	do_next
end

	def exit_program
		puts "\nHave a great day!"
	end

end


barn = Inventory.new