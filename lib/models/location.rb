class Location < ActiveRecord::Base
	has_many :episodes_characters_locations
  has_many :episodes, through: :episodes_characters_locations
  has_many :characters, through: :episodes_characters_locations
  has_many :lines, through: :episodes_characters_locations
  
end
