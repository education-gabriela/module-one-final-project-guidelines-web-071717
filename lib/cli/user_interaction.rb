class UserInteraction

  def run
    welcome
    input = get_user_input
  end

  def method_list
    {
      characters: {
        description: "Gets information about characters",
        methods: {find_by: "Find a character by attribute: value",
                  lines: "List all the lines a character has ever spoken"}
      },
      episodes: {
        description: "Gets information about episodes",
        methods: {find_by: "find an episode by attribute: value"}
      },
      locations: {
        description: "Gets information about locations",
        methods: {find_by: "find an episode by attribute: value"}
      },
      lines: {
        description: "gets information about lines",
        methods: {find_by: "find a line by attribute: value",
                  find: "find information on up to 20 lines of dialogue containing the given string"}
      },
      help: {
        description: "show this menu"
      }
    }
  end

  def message_list
    {
      welcome: "WELCOME!",
      help: "sorry no help here",
      invalid_input: "Sorry, that is not a valid command. Type 'help' to see a list of valid commands."
    }
  end

  def show_commands
    puts "Enter one of the following commands:\n\n"
    self.method_list.each do |method_name, method_list|
      puts "#{method_name} - #{method_list[:description]}"
      # binding.pry
      if method_list[:methods]
        method_list[:methods].each do |submethod_name, submethod_description|
          puts "  #{submethod_name} - #{submethod_description}"
        end
      end
      # puts "\n"
    end
  end

  # welcome the user and then print help message containing valid commands
  def welcome
    puts message_list[:welcome]
    # help
  end

  # take in user input
  def get_user_input
    input = gets.chomp
    parse_user_input(input)
  end

  def parse_user_input(input)
    possible_commands = input.split(" ")

    if possible_commands.count == 0
      puts "Command empty, please try again:"
      get_user_input
    elsif possible_commands.count == 1 && possible_commands[0] == "help"
      show_commands
      get_user_input
    elsif possible_commands[0] && possible_commands[1]
      command1 = possible_commands[0].to_sym
      command2 = possible_commands[1].to_sym

      binding.pry
    end

  end

  # compare user input to method_list
  def get_method_from_input
    method_list.each do |method_category|
      method_category[:methods].keys.each do |method_name|
        # do comparison here?

      end
    end
  end

  # make call to query method based on user input
  def call_query

  end
end
