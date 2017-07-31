class CreateEpisodesCharactersLocations < ActiveRecord::Migration[5.0]
  def change
  	create_table :episodes_characters_locations do |t| 
  		t.integer :episode_id
  		t.integer :character_id
  		t.integer :location_id
  	end
  end
end
