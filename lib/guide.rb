require 'restaurant'
class Guide
  
  class Config
    @@actions = ['list', 'find', 'add', 'quit']
    def self.actions; @@actions; end
  end
  
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
  end
  
  def launch!
    introduction
    # action loop
    result = nil
    until result == :quit
      action = get_action
      result =  do_action(action)
    end
      conclusion
  end
  
  def get_action
    action = nil
    # Keep asking for user input until we get a valid action
    until Guide::Config.actions.include?(action)
      puts "Actions:" + Guide::Config.actions.join(", ") if action
      print "> "
      user_response = gets.chomp
      action = user_response.downcase.strip
    end
    return action
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