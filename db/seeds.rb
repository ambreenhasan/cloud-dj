
room_names = ["Cool Partay Room", "Welcome to the Fun", "Room 3", "Beep Bop", "Room 5", "Chill like Alex", "Alex's Dream", "Alex, the Cool", "Alex al Ex?", "Kangaroos Do's", "TeeHee For Me"]

more_descriptions = ["Blowing the roof off of quiet personal gatherings",
"Lounging around doing nothing", "archery is the best sport ever", "AJAX for WWHHAAaattt?!?!", "git push origin master!","Friday night and nothing to do", "come in for the worst music in the world"]

room_names.each do |name|
  Room.create(name: name, description: more_descriptions.sample, publicness: true, user_id: 1)
end

people_names = ["alex", "Ambreen", "Daniel", "Michael"]

people_names.each do |name|
  email = name + "@alex.alex"
  User.create(first_name: name, email: email, password: "alex")
end

100.times do
  RoomUser.create(room_id: rand(1..10), user_id: 1)
end

song_names = ["Radiohead", "Creep", "OkComputer Song", "Ambreen and the Mikes", "Hate Death Dead", "Rubber Dodgeballs", "Cry Cry Cry"]

# song_names.each do |song|
#   @song = Song.create(title: song)
#   UserStar.create(song_id: @song.id, user_id: 1)
# end



#   User.create(email: Faker::Internet.email, password_hash: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)

#   RoomInvite.create(inviter_id: User.all.sample.id, invitee_id: User.all.sample.id, room_id: rand(1..10))

#   Song.create(user_id: User.all.sample.id, room_id: rand(1..5), api_id: "#{rand(1..100)}")

#   UserStar.create(song_id: rand(1..20), user_id: User.all.sample.id)

# end

# 100.times do
#   UserVote.create(user_id: User.all.sample.id, song_id: Song.all.sample.id, room_id: rand(1..5))
# end

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
