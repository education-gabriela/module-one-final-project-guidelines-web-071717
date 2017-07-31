class CreateCharacterEpisodesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :characters_episodes do |t|
      t.integer :character_id
      t.integer :episode_id
    end
  end
end
