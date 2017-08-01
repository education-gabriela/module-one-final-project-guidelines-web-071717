class CreateEpisodesCharactersLocations < ActiveRecord::Migration[5.0]
  def change
  	create_table :episodes_characters_locations do |t| 
  		t.integer :episode_id
  		t.integer :character_id
  		t.integer :location_id
    end

    add_index :episodes_characters_locations, :character_id
    add_index :episodes_characters_locations, :episode_id
    add_index :episodes_characters_locations, :location_id
  end
end
