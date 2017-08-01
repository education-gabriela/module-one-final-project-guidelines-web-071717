class CreateAppearances < ActiveRecord::Migration[5.0]
  def change
  	create_table :appearances do |t| 
  		t.integer :episode_id
  		t.integer :character_id
    end

    add_index :appearances, :character_id
    add_index :appearances, :episode_id
  end
end
