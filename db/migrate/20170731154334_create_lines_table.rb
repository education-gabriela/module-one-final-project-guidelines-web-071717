class CreateLinesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :lines do |t|
      t.integer :episode_id
      t.integer :character_id
      t.integer :location_id
      t.integer :number
      t.text :character_line
      t.text :character_normalized_line
    end
  end
end
