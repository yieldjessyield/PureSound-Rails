class ArtistsController < ApplicationController
  # skip_before_action :authenticate_user
  # def create
  #   # check out params, they are awesome
  #   #  save this data to artist tabel in db
  #   # render back a conformatin that data was saved
  # end

  def create
    artist1 = {}
    artist2 = {}
    artist3 = {}

   artist1["artist_spotify_id"] = params["artists"]["artistsData"][0]["artist_spotify_id"]
   artist1["name"] = params["artists"]["artistsData"][0]["name"]
   artist1["image"] = params["artists"]["artistsData"][0]["image"]

   artist2["artist_spotify_id"] = params["artists"]["artistsData"][1]["artist_spotify_id"]
   artist2["name"] = params["artists"]["artistsData"][1]["name"]
   artist2["image"] = params["artists"]["artistsData"][1]["image"]

   artist3["artist_spotify_id"] = params["artists"]["artistsData"][2]["artist_spotify_id"]
   artist3["name"] = params["artists"]["artistsData"][2]["name"]
   artist3["image"] = params["artists"]["artistsData"][2]["image"]

   artists = [artist1, artist2, artist3]

    # byebug

    user = User.find(current_user.id)

    liked_artists = []

    # make sure artists array is coming into here
      artists.each do |artist|
        # byebug
      new_artist = Artist.find_or_create_by(artist_spotify_id: artist["artist_spotify_id"], name: artist["name"], image: artist["image"])

      UserArtist.find_or_create_by(artist_id: new_artist.id, user_id: user.id)

      liked_artists.push(new_artist)
      end
      # byebug
    render json: {liked_artists: liked_artists}
  end

  # this is called after a user logs in and is used to grab the user's previously liked artists
  def liked_artists()
    user = User.find(current_user.id)
    liked_artists = user.artists
    send_artists = []
    liked_artists.each do |artist|
      send_artists << artist
    end
    # byebug
    render json: {liked_artists: send_artists}
  end

  # private
  # # something is off with the params and passing this crap in :(
  # def artists_params
  #   byebug
  #   # params.require(:artists).permit(:artistsData)
  #   # params.require(:artists).permit(artistsData: [ artist1: [:artist_spotify_id, :name, :image], artist2: [:artist_spotify_id, :name, :image], artist3: [:artist_spotify_id, :name, :image] ])
  #   params.require(:artists).permit(:artistsData => [:artist1 => [:artist_spotify_id, :name, :image], :artist2 => [:artist_spotify_id, :name, :image], :artist1 => [:artist_spotify_id, :name, :image]])
  # end

end
