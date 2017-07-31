class Character < ActiveRecord::Base
  has_many :lines
  has_many :characters_episodes
  has_many :episodes, through: :characters_episodes
  has_many :episodes_locations, through: :episodes
  has_many :locations, -> {group('location_id')}, through: :episodes_locations
end
