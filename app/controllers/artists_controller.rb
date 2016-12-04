class ArtistsController < ApplicationController
  skip_before_action :authenticate_user
  # def create
  #   # check out params, they are awesome
  #   #  save this data to artist tabel in db
  #   # render back a conformatin that data was saved
  # end

  def create
   byebug
    # user_data:{id: id, artists: [{artist_data}, {artist_data}, {artist_data}]}
    # make sure artist id is an integer
    user = User.find(user_data.id)
    # make sure artists array is coming into here
    liked_artists = []
      artists.each do |artist|
      # make sure the keys and values are correct below
      new_artist = Artist.find_or_create_by(artist_spotify_id: artist.id, name: artist.name, image: artist.image)
      User.artist = new_artist
      liked_artists.push(new_artist)
      end
    liked_artists
  end

  private
  # something is off with the params and passing this crap in :(
  def artists_params
    params.require(:artists).permit(:artistsData)
  end

end
