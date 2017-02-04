require 'restaurant'
class Guide
  
  def initialize(path=nil)
    # locate the restaurant test file at path
    Restaurant.filepath = path
    if Restaurant.file_usable?
      puts "Found restaurant file"
    # or create a new file
    elsif Restaurant.create_file
      puts "Created Restaurant file"
    # exit if create fails
    else
      puts "Exiting. \n\n"
      exit!
    end
  end #done 
  
  def launch!
    introduction
    # action loop
    result = nil
    until result == :quit
      #  what do you want to do? (list, find, add ,quit)
      print "> "
      user_response = gets.chomp
      #  do that action
      result =  do_action(user_response)
    end
      conclusion
  end
  
  def do_action(action)
    case action
    when 'list'
      puts "listing..."
    when 'find'
      puts "finding..."
    when 'add'
      puts "adding..."
    when 'quit'
      return :quit
    else
      puts "\nI don't understand that command.\n"
    end
  end
  
  def introduction
    puts "\n\n<<< Welcome to the Grub Hunt >>>\n\n"
    puts "This is an interactive guide to help you find the food you crave. \n\n"
  end
  
  def conclusion
    puts "\n<<< Goodbye and Bon Appetit! >>>\n\n\n"
  end
  
end