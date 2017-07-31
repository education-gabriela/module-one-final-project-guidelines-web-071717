class CreateEpisodeLocationsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :episode_location do |t|
      t.integer :episode_id
      t.integer :location_id
    end
  end
end