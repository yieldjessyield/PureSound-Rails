class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.string :artist_spotify_id
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
