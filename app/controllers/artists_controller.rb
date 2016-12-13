class ArtistsController < ApplicationController

  def create
    # ArtistAdaptor.run(data)
    artist1 = {}
    artist2 = {}
    artist3 = {}

   artist1["artist_spotify_id"] = params["artists"]["artistsData"][0]["artistId"]
   artist1["name"] = params["artists"]["artistsData"][0]["artistName"]
   artist1["image"] = params["artists"]["artistsData"][0]["artistUrl"]

   artist2["artist_spotify_id"] = params["artists"]["artistsData"][1]["artistId"]
   artist2["name"] = params["artists"]["artistsData"][1]["artistName"]
   artist2["image"] = params["artists"]["artistsData"][1]["artistUrl"]

   artist3["artist_spotify_id"] = params["artists"]["artistsData"][2]["artistId"]
   artist3["name"] = params["artists"]["artistsData"][2]["artistName"]
   artist3["image"] = params["artists"]["artistsData"][2]["artistUrl"]

   artists = [artist1, artist2, artist3]

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
  def liked_artists
    user = User.find(current_user.id)
    liked_artists = user.artists
    send_artists = []
    liked_artists.each do |artist|
      send_artists << artist
    end
    # byebug
    render json: {liked_artists: send_artists}
  end

  def save_liked_artist
    user = User.find(current_user.id)

    check_user_artists = []
    liked_artists = []

    user.artists.each do |artist|
      check_user_artists << artist.artist_spotify_id
    end
    if check_user_artists.include?(params["likedArtistData"]["spotify_id"])
      render json: {liked_artists: user.artists}
    else
      # make sure these params are ok above and below
      new_artist = Artist.find_or_create_by(artist_spotify_id: params["likedArtistData"]["spotify_id"], name: params["likedArtistData"]["name"], image: params["likedArtistData"]["image"])
      UserArtist.find_or_create_by(artist_id: new_artist.id, user_id: user.id)

      # byebug
        render json: {liked_artists: user.artists.reload}
      # check this
    end
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
