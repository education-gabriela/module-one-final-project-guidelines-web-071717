class Character < ActiveRecord::Base
  has_many :appearances
  has_many :episodes, through: :appearances
  has_many :lines, through: :appearances
  has_many :locations, through: :lines
  

  extend Importable::ClassMethods

  def self.print_first_ten
    Character.first(10).each do |character|
      puts character.name
    end
  end
end
