10.times do
  User.create(email: Faker::Internet.email, password_hash: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)

  RoomInvite.create(inviter_id: User.all.sample.id, invitee_id: User.all.sample.id, room_id: rand(1..10))

  Song.create(user_id: User.all.sample.id, room_id: rand(1..5), api_id: "#{rand(1..100)}")

  UserStar.create(song_id: rand(1..20), user_id: User.all.sample.id)

end

100.times do
  UserVote.create(user_id: User.all.sample.id, song_id: Song.all.sample.id, room_id: rand(1..5))
end

# 100.times do
#   Song.create(name: Faker::Hacker.adjective, artist: Faker::Hacker.abbreviation , album: Faker::Commerce.color, soundcloud_id: rand(100))
# end

# 10.times do
#   User.all.each do |user|
#     Playlist.create(user_id: user.id, song_id: Song.all.sample.id)
#   end
# end

# 1.times do
#   genre.each do |genre|
#     Genre.create(name: genre)
#   end
# end

# 100.times do
#   GenreSong.create(genre_id: Genre.all.sample.id, song_id: Song.all.sample.id)
# end

# 1000.times do
#   Choice.create(user_id: User.all.sample.id, song_id: Song.all.sample.id, liked_disliked: choice.sample)
# end