class CreateJoinTableCharactersEpisodes < ActiveRecord::Migration[5.0]
  def change
    create_join_table :episodes, :characters
  end
end
