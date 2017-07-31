class Line < ActiveRecord::Base
  belongs_to :episodes_characters_location
  # belongs_to :episode, through: :episodes_characters_location
  # belongs_to :character, through: :episodes_characters_location
  # belongs_to :location, through: :episodes_characters_location
end
