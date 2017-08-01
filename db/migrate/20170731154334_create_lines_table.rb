class CreateLinesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :lines do |t|
      t.integer :episodes_characters_location_id
      t.integer :number
      t.integer :timestamp_in_ms
      t.integer :character_id
      t.integer :episode_id
      t.integer :location_id
      t.text :character_line
      t.text :character_normalized_line
      t.integer :word_count
    end

    add_index :lines, :character_id
    add_index :lines, :episode_id
    add_index :lines, :location_id
  end
end
