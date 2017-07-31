class Character < ActiveRecord::Base
  has_many :lines
  has_many :characters_episodes
  has_many :episodes, through: :characters_episodes
end
