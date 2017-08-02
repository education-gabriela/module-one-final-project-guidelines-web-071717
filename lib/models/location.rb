class Location < ActiveRecord::Base
	has_many :lines
  has_many :appearances, through: :lines
  has_many :episodes, through: :appearances
  has_many :characters, through: :appearances

  extend Importable::ClassMethods, Formatable::ClassMethods, Findable::ClassMethods
end
