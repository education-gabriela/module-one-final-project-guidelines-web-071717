class Line < ActiveRecord::Base
  belongs_to :character
  belongs_to :location
  belongs_to :episode
end
