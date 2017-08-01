class CreateAppearances < ActiveRecord::Migration[5.0]
  def change
  	create_table :appearances do |t| 
  		t.integer :episode_id
  		t.integer :character_id
    end

    add_index :episodes_characters_locations, :character_id
    add_index :episodes_characters_locations, :episode_id
  end
end
