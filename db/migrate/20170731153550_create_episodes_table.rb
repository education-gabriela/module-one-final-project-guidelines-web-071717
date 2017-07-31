class CreateEpisodesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :episodes do |t|
      t.string :title
      t.date :original_air_date
      t.integer :season
      t.integer :number_in_season
      t.integer :number_in_series
      t.decimal :us_viewers_in_millions
      t.decimal :imdb_rating
      t.decimal :imdb_votes
    end
  end
end
