class CreateLinesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :lines do |t|
      t.integer :episodes_characters_location_id
      t.integer :number
      t.text :character_line
      t.text :character_normalized_line
    end
  end
end
