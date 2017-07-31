class EpisodesLocation < ActiveRecord::Base
  belongs_to :episode
  belongs_to :location
end
