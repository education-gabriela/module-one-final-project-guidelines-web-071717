episode1 = Episode.create(title: "Title 1", original_air_date: "2017-07-31")
episode2 = Episode.create(title: "Title 2", original_air_date: "2017-06-05")

character1 = Character.create(name: "Lisa Simpson", normalized_name: "lisa simpson", gender: "f")
character2 = Character.create(name: "Homer Simpson", normalized_name: "homer simpson", gender: "f")
character3 = Character.create(name: "Bart Simpson", normalized_name: "bar simpson", gender: "f")

CharactersEpisode.create(episode: episode1, character: character1)
CharactersEpisode.create(episode: episode1, character: character2)
CharactersEpisode.create(episode: episode1, character: character3)

CharactersEpisode.create(episode: episode2, character: character1)
CharactersEpisode.create(episode: episode2, character: character2)

location1 = Location.create(name: "Car")
location2 = Location.create(name: "Simpsons House")

EpisodesLocation.create(episode: episode1, location: location1)
EpisodesLocation.create(episode: episode1, location: location2)
EpisodesLocation.create(episode: episode2, location: location2)
