class Location < ActiveRecord::Base
	has_many :lines

  extend Importable::ClassMethods
end
