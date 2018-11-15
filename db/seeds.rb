require "faker"
# TODO: Write a seed to insert 100 posts in the database

if Rails.env.development?
 JamSession.destroy_all
 Band.destroy_all
 User.destroy_all
end

AREAS = %w(Shibuya Shinjuku Meguro Ikebukuro Shin-Okubo)

10.times do
  User.create(
    name: Faker::Name.name,
    instrument: Faker::Music.instrument,
    description: "I'm looking for a #{Faker::Music.genre} band to join.",
    photo: "ag2ergewffew",
    email: Faker::Internet.email,
    password: "123456")
end

counter = 0
photos = ["avatar_1.jpg", "avatar_2.jpg", "avatar_3.jpg", "avatar_4.jpg", "avatar_5.jpg", "avatar_6.jpg"]
6.times do
  instrument = Faker::Music.instrument
  Band.create(
    name: Faker::RockBand.name,
    genre: Faker::Music.genre,
    description: "We need a #{instrument} player to join and help us build our future album, '#{Faker::Music.album }'.",
    instrument: instrument,
    address: AREAS.sample,
    photo: photos[counter],
    user: User.all.sample
    )
  counter += 1
end
sample_user = User.first
sample_band = Band.first
5.times do
  JamSession.create(
    status: "Pending",
    user: sample_user,
    band: sample_band
  )
end
