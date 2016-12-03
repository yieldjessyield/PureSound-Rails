# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do(User.create(password: "password", email: Faker::Internet.email, phone_number: Faker::PhoneNumber.cell_phone))
end

kanye = Artist.create(artist_spotify_id: "5K4W6rqBFWDnAN6FQUkS6x")
Artist.create(artist_spotify_id: "12Chz98pHFMPJEknJQMWvI")
Artist.create(artist_spotify_id: "0OdUWJ0sBjDrqHygGUXeCF")
Artist.create(artist_spotify_id: "6vWDO969PvNqNYHIOW5v0m")
Artist.create(artist_spotify_id: "2h93pZq0e7k5yf4dywlkpM")
Artist.create(artist_spotify_id: "3yYUV3hkJit05YIUEODqgp")
Artist.create(artist_spotify_id: "0x4xCoWaOFd3WsKarzaxnW")
Artist.create(artist_spotify_id: "57anmI1X2hXWPrNagFdzZr")
Artist.create(artist_spotify_id: "0oSGxfWSnnOXhD2fKuz2Gy")
Artist.create(artist_spotify_id: "6o1OmogjJFsHeNKtdNC4Ku")
Artist.create(artist_spotify_id: "5Q1Z6EpbUwx5ESY4jGJXVg")
Artist.create(artist_spotify_id: "6sFIWsNpZYqfjUpaCgueju")


UserArtist.create(user_id: 1, artist_id: kanye.id)
UserArtist.create(user_id: 1, artist_id: 2)
UserArtist.create(user_id: 1, artist_id: 3)
UserArtist.create(user_id: 13, artist_id: 3)
UserArtist.create(user_id: 14, artist_id: 3)
UserArtist.create(user_id: 16, artist_id: 3)
UserArtist.create(user_id: 6, artist_id: kanye.id)
