class Character < ActiveRecord::Base
  has_many :appearances
  has_many :episodes, through: :appearances
  has_many :lines, through: :appearances
  has_many :locations, through: :lines
  

  extend Importable::ClassMethods
end
