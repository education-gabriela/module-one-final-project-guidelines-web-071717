class Episode < ActiveRecord::Base
  has_many :appearances
	has_many :lines, through: :appearances
  has_many :characters, through: :appearances
  has_many :locations, through: :lines

  

  extend Importable::ClassMethods
end
