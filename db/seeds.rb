# episode1 = Episode.create(title: "Title 1", original_air_date: "2017-07-31")
# episode2 = Episode.create(title: "Title 2", original_air_date: "2017-06-05")
#
# character1 = Character.create(name: "Lisa Simpson", normalized_name: "lisa simpson", gender: "f")
# character2 = Character.create(name: "Homer Simpson", normalized_name: "homer simpson", gender: "f")
# character3 = Character.create(name: "Bart Simpson", normalized_name: "bar simpson", gender: "f")
#
# location1 = Location.create(name: "Car")
# location2 = Location.create(name: "Simpsons House")
#
# EpisodesCharactersLocation.create(episode: episode1, location: location1, character: character1)
# EpisodesCharactersLocation.create(episode: episode1, location: location2, character: character1)
# EpisodesCharactersLocation.create(episode: episode2, location: location2, character: character3)
# EpisodesCharactersLocation.create(episode: episode2, location: location2, character: character2)
#
# line1 = Line.create(episodes_characters_location_id: 1, character_line: 'hey i play the saxophone and im in the car in episode 1')
# line2 = Line.create(episodes_characters_location_id: 2, character_line: 'i am lisa in the house and youre in episode 1')
# line3 = Line.create(episodes_characters_location_id: 3, character_line: 'hey im bart in the haus in episode 2')
# line4 = Line.create(episodes_characters_location_id: 4, character_line: 'hey im homer in the haus in episode 2')

#### IMPORTING THE FILES THROUGH THE DATABASE ###
puts "Importing Episodes..."
Episode.import(Dir.pwd + "/db/csv/simpsons_episodes.csv")
puts "Importing Locations..."
Location.import(Dir.pwd + "/db/csv/simpsons_locations.csv")
puts "Importing Characters..."
Character.import(Dir.pwd + "/db/csv/simpsons_characters.csv")
puts "Importing Lines..."
Line.import(Dir.pwd + "/db/csv/simpsons_lines.tsv")

puts "Clearning the null out of the table `lines`"
sql_delete = <<-SQL
DELETE
FROM lines
WHERE character_id IS NULL OR episode_id IS NULL;
SQL

ActiveRecord::Base.connection.execute(sql_delete)

puts "Saving data to `episodes_characters_locations`..."
sql_ecl = <<-SQL
 INSERT INTO appearances (episode_id, character_id)
  SELECT
    episode_id,
    character_id
  FROM lines
  GROUP BY episode_id, character_id
SQL

ActiveRecord::Base.connection.execute(sql_ecl)

puts "Updating table `lines`..."
sql_update_lines = <<-SQL
UPDATE lines
SET
  appearance_id = (SELECT id
                 FROM appearances
                 WHERE
                   episode_id = lines.episode_id AND character_id = lines.character_id)
SQL

ActiveRecord::Base.connection.execute(sql_update_lines)
