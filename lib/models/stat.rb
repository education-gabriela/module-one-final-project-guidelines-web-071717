class Stat
  extend Formatable::ClassMethods

  def self.show_characters_stats(limit = 10)
    stats = Character.joins(:lines).group("characters.id").limit(limit)
              .pluck(:id, :name, "count(DISTINCT lines.location_id) as total_locations", "count(DISTINCT appearances.episode_id) as total_episodes", "count(*) AS total_lines")
    keys = [:id, :name, :total_locations, :total_episodes, :total_lines]
    hash = self.objectify(keys, stats)
    self.tablefy(hash)
  end

  def self.show_episodes_stats(limit = 10)
    stats = Episode.valid_episodes.joins(:lines).group(:id).limit(limit)
              .pluck(:id, :title, "count(DISTINCT lines.location_id) as total_locations", "count(DISTINCT appearances.character_id) as total_characters", "count(*) AS total_lines")
    keys = [:id, :title, :total_locations, :total_characters, :total_lines]
    hash = self.objectify(keys, stats)
    self.tablefy(hash)
  end

  def self.show_locations_stats(limit = 10)
    stats = Line.joins(:location).joins(:appearance).group(:location_id).order("total_lines DESC").limit(limit)
              .pluck("locations.id", "locations.name", "count(DISTINCT appearances.character_id) as total_character_id", "count(DISTINCT appearances.episode_id) as total_episodes", "count(*) as total_lines")
    keys = [:id, :name, :total_characters, :total_episodes, :total_lines]
    hash = self.objectify(keys, stats)
    self.tablefy(hash)
  end
end
