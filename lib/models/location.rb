class Location < ActiveRecord::Base
  has_many :lines
  has_many :episodes_locations
  has_many :episodes, through: :episodes_locations

  extend Importable::ClassMethods
end
