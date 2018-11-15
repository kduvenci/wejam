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
photos = url("https://www.tailored-entertainment.com/assets/images/artists/Folk-Junkies-Band-Surrey/folk-junkies-main_1440154957.jpg", "https://cdn.newsapi.com.au/image/v1/e1f851445dc795c9ef289167e65d0bd1?width=1024", "https://images.easyweddings.com.au/s3/ew-image-global/Live/ImageUploader/d3ff8d23-8620-4d3c-8339-f773a37886d6-BBB_06.jpg?quality=80&format=jpg&mode=crop&crop=0,0,0,0&width=1200", "https://www.tailored-entertainment.com/assets/images/artists/Just-For-Tonight-Band-Midlands/just-for-tonight-main_1486635361.jpg", "https://rockchicksrule.files.wordpress.com/2013/10/scandaljp-01.jpg", "http://www.oneokrock.com/wp-content/uploads/2016/05/7c3a5f0fa95101d2d2923e447e1b9abf.jpg")
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
