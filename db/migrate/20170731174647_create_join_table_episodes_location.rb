class CreateJoinTableEpisodesLocation < ActiveRecord::Migration[5.0]
  def change
    create_join_table :locations, :episodes
  end
end
