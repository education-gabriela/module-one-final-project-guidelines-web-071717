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
    puts "Usage: ".colorize(:yellow) + "<command> ".colorize(:cyan) + "<subcommand> ".colorize(:magenta) + "[<value>]\n".colorize(:light_red)
    puts "Sample:".colorize(:yellow)
    puts "\tcharacters".colorize(:cyan) + " find_by_name".colorize(:magenta) + " lisa".colorize(:light_red)
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
    begin
      parse_user_input(input)
    rescue StandardError
      invalid_command
    end
  end

  def command_to_execute(first, second)
    command1 = first.to_sym
    command2 = second.to_sym
    method_list[command1][:methods][command2]
  end

  def parse_user_input(input)
    possible_commands = input.split(" ")
    if possible_commands.count == 0
      puts message_list[:command_empty].colorize(:light_red)
      get_user_input
    elsif possible_commands.count == 1 && possible_commands[0] == "help"
      show_commands
      get_user_input
    elsif possible_commands.count == 1 && possible_commands[0] == "exit"
      puts "\nGoodbye.\n".colorize(:blue)
      exit
    elsif possible_commands.count == 2 && possible_commands[0] && possible_commands[1]
      if method_list[possible_commands[0].to_sym] && command_to_execute(*possible_commands.first(2))
        to_execute = command_to_execute(*possible_commands.first(2))
        class_name = to_execute[:model]
        method_name = to_execute[:method]

        call_query(class_name, method_name)
      else
        invalid_command
      end
    elsif possible_commands.count >= 3 && command_to_execute(*possible_commands.first(2))
      command_to_string = possible_commands[2..-1].join(" ")
      to_execute = command_to_execute(*possible_commands.first(2))
      class_name = to_execute[:model]
      method_name = to_execute[:method]

      call_query(class_name, method_name, command_to_string)
    else
      invalid_command
    end
    get_user_input
  end

  def call_query(class_name, method_name, args = nil)
    if args == nil
      result = class_name.to_s.singularize.capitalize.constantize.send(method_name)
    else
      result = class_name.to_s.singularize.capitalize.constantize.send(method_name, args)
    end

    puts result
  end
end
