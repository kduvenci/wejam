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


6.times do
  instrument = Faker::Music.instrument
  Band.create(
    name: Faker::RockBand.name,
    genre: Faker::Music.genre,
    description: "We needs a #{instrument} player to join and help us build our future album, '#{Faker::Music.album }'.",
    instrument: instrument,
    address: AREAS.sample,
    photo: "ag2ergewffew",
    user: User.all.sample
    )
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
