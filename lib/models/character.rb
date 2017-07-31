class Character < ActiveRecord::Base
  has_many :episodes_characters_locations
  has_many :episodes, through: :episodes_characters_locations
  has_many :locations, through: :episodes_characters_locations
  has_many :lines, through: :episodes_characters_locations

  extend Importable::ClassMethods
end
