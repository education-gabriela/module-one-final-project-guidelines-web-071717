class Episode < ActiveRecord::Base
  has_many :lines
  has_many :characters_episodes
  has_many :characters, through: :characters_episodes
  has_many :episodes_locations
  has_many :locations, through: :episodes_locations

  extend Importable::ClassMethods
end
