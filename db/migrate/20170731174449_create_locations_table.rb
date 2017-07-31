class CreateLocationsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :normalized_name
    end
  end
end
