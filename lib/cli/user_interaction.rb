require 'colorize'

class UserInteraction
  attr_accessor :method_list
  extend Formatable::ClassMethods

  def initialize
    @method_list = YAML.load_file("config/method_list.yml")
  end

  def run
    puts the_simpsons_logo.colorize(:yellow)
    show_commands
    get_user_input
  end

  def message_list
    {
      welcome: "WELCOME!",
      help: "sorry no help here",
      invalid_input: "Sorry, that is not a valid command.",
      command_empty: "Command empty, please try again:"
    }
  end

  def invalid_command
    puts message_list[:invalid_input].colorize(:light_red)
    get_user_input
  end

  def the_simpsons_logo
    <<-SIMPSONS
_________________________________________________

    ___(_)_ __ ___  _ __  ___  ___  _ __  ___ 
   / __| | '_ ` _ \\| '_ \\/ __|/ _ \\| '_ \\/ __|
   \\__ \\ | | | | | | |_) \\__ \\ (_) | | | \\__ \\
   |___/_|_| |_| |_| .__/|___/\\___/|_| |_|___/
                   |_|
_________________________________________________
    SIMPSONS
  end

  def show_commands
    puts "Enter one of the following commands:\n\n"
    rows = []
    puts "Usage: ".colorize(:yellow) + "<command> ".colorize(:cyan) + "<subcommand> ".colorize(:magenta)  + "[<value>]\n".colorize(:light_red)
    puts "Sample:".colorize(:yellow)
    puts "\tcharacters".colorize(:cyan) + " find_by_name".colorize(:magenta)  + " lisa".colorize(:light_red)
    puts "\tstats".colorize(:cyan) + " show_episodes_stats\n\n".colorize(:magenta)
    self.method_list.each do |method_name, method_list|
      rows << [method_name.to_s.colorize(:cyan), method_list[:description]]

      if method_list[:methods]
        method_list[:methods].each do |submethod_name, submethod_description|
          rows << ["  #{submethod_name.to_s.colorize(:magenta)}", submethod_description[:description]]
        end
      end
    end
    table = TTY::Table[*rows]
    puts table.to_s
    puts "\n"
  end

  # welcome the user and then print help message containing valid commands
  def welcome
    puts message_list[:welcome]
    # help
  end

  # take in user input
  def get_user_input
    print ">>  "
    input = gets.chomp
    parse_user_input(input)
  end

  def parse_user_input(input)
    possible_commands = input.split(" ")
    # command1 will always be (super)method (sym except for help and exit)
    # iff exists.....
    # command 2 will always be submethod (sym)
    # command 3 will always be value searched (string)


    # if command is empty
    if possible_commands.count == 0
      puts message_list[:command_empty].colorize(:red)
      get_user_input

      # elsif command is exactly 'help' or 'exit'
    elsif possible_commands.count == 1
      if possible_commands[0] == "help"
        show_commands
        get_user_input
      elsif possible_commands[0] == "exit"
        exit
      else
        puts message_list[:invalid_input].colorize(:light_red)
        get_user_input
      end

      # elsif command contains 2 words
    elsif possible_commands[0] && possible_commands[1]
      command1 = possible_commands[0].to_sym
      command2 = possible_commands[1].to_sym

      # check to see that command1 (submethod) is valid before proceeding (avoid nil[] error)
      if method_list[command1]
        # check to see that command2 is a valid method
        if method_list[command1][:methods][command2]
          # if no additional commands, process
          if possible_commands.count == 2
            class_name = method_list[command1][:methods][command2][:model]
            method_name = method_list[command1][:methods][command2][:method]

            call_query(class_name, method_name)

            # if command contains 3+ words
          elsif possible_commands[2]
            command3string = possible_commands[2..-1].join(" ")
            class_name = method_list[command1][:methods][command2][:model]
            method_name = method_list[command1][:methods][command2][:method]
            call_query(class_name, method_name, command3string)
          end
        else
          invalid_command
        end
      else
        invalid_command
      end
    else
      invalid_command
    end

    # return to beginning
    get_user_input
  end

  # given valid class_name and method_name, make the call
  def call_query(class_name, method_name, args = nil)
    if args == nil
      result = class_name.to_s.singularize.capitalize.constantize.send(method_name)
    else
      result = class_name.to_s.singularize.capitalize.constantize.send(method_name, args)
    end

    puts result
  end
end
