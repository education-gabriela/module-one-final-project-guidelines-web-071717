class Appearance < ActiveRecord::Base
	has_many :lines
	belongs_to :episode
	belongs_to :character

end
