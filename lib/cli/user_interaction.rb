class UserInteraction

	def run
		welcome
		get_user_input
	end

	def method_list
		methods = {
			characters: {
				description: "Gets information about characters",
				methods: {
					find_by: "Find a character by attribute: value",
					lines: "List all the lines a character has ever spoken"

				}
			},
			episodes: {
				description: "Gets information about episodes",
				methods: {
					find_by: "find an episode by attribute: value"
				}
			},
			locations: {
				description: "Gets information about locations",
				methods: {
					find_by: "find an episode by attribute: value"
				}
			},
			lines: {
				description: "gets information about lines",
				methods: {
					find_by: "find a line by attribute: value",
					find: "find information on up to 20 lines of dialogue containing the given string"
				}
			}
		}
	end

	def message_list
		messages = {
			welcome: "WELCOME!",
			help: "sorry no help here",
			invalid_input: "Sorry, that is not a valid command. Type 'help' to see a list of valid commands."
		}
	end

	# welcome the user and then print help message containing valid commands
	def welcome
		puts message_list[:welcome]
		help
	end

	# print valid commands
	def help
		puts message_list[:help]
	end


	# take in user input
	def get_user_input
		input = gets.chomp
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
