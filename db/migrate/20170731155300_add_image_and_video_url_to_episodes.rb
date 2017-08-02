class AddImageAndVideoUrlToEpisodes < ActiveRecord::Migration[5.0]
  def change
    add_column :episodes, :image_url, :text
    add_column :episodes, :video_url, :text
  end
end
