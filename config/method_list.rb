{
  characters: {
    description: "Gets information about characters",
    methods: {
      print_first_ten: {
        description: "Print first 10",
        model: "character",
        method: "print_first_ten"
      }
    }
    # {find_by: "Find a character by attribute: value",
    #         lines: "List all the lines a character has ever spoken"}
  },
  episodes: {
    description: "Gets information about episodes",
    methods: {find_by: "find an episode by attribute: value"}
  },
  locations: {
    description: "Gets information about locations",
    methods: {find_by: "find an episode by attribute: value"}
  },
  stats: {
    description: "Curiosities about The Simpsons",
    methods: {
      get_the_most_popular_location: {
        description: "Shows the most popular location",
        model: "stat",
        method: "get_the_most_popular_location"
      },
      test: {
        description: "Test Method",
        model: "stat",
        method: "test"
      }
    }
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
