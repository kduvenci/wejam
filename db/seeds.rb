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
photos = ["https://www.dropbox.com/s/u7mtx85osfzm5fe/avatar%201.jpg?dl=0", "https://www.dropbox.com/s/adc56qitf301tff/avatar%202.jpg?dl=0", "https://www.dropbox.com/s/fio2cfexka331br/avatar%203.jpg?dl=0", "https://www.dropbox.com/s/y5yy3dz6bx5fy35/avatar%204.jpg?dl=0", "https://www.dropbox.com/s/8t473353m58rlh7/avatar%205.jpg?dl=0", "https://www.dropbox.com/s/jjq1tw715zp6157/avatar%206.jpg?dl=0"]
6.times do
  instrument = Faker::Music.instrument
  band = Band.new(
    name: Faker::RockBand.name,
    genre: Faker::Music.genre,
    description: "We need a #{instrument} player to join and help us build our future album, '#{Faker::Music.album }'.",
    instrument: instrument,
    address: AREAS.sample,
    user: User.all.sample
    )
  band.remote_photo_url = photos[counter]
  band.save!
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
