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
photos = ["https://www.tailored-entertainment.com/assets/images/artists/Folk-Junkies-Band-Surrey/folk-junkies-main_1440154957.jpg", "https://cdn.newsapi.com.au/image/v1/e1f851445dc795c9ef289167e65d0bd1?width=1024", "https://images.easyweddings.com.au/s3/ew-image-global/Live/ImageUploader/d3ff8d23-8620-4d3c-8339-f773a37886d6-BBB_06.jpg?quality=80&format=jpg&mode=crop&crop=0,0,0,0&width=1200", "https://www.tailored-entertainment.com/assets/images/artists/Just-For-Tonight-Band-Midlands/just-for-tonight-main_1486635361.jpg", "https://rockchicksrule.files.wordpress.com/2013/10/scandaljp-01.jpg", "http://www.oneokrock.com/wp-content/uploads/2016/05/7c3a5f0fa95101d2d2923e447e1b9abf.jpg", "https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/SANGUINE_IMG_9965.jpg/1200px-SANGUINE_IMG_9965.jpg", "https://i1.wp.com/www.davidsmusichouse.com/wp-content/uploads/2011/03/buzzystudio.jpg","https://i.ytimg.com/vi/p8SviZ9-rc0/maxresdefault.jpg","https://ic.pics.livejournal.com/lightinthemind/13847049/171763/171763_original.jpg", "http://cdn.theatlantic.com/static/mt/assets/culture_test/MumfordandSons_LukeMacGregor_post2.jpg", "https://www.tailored-entertainment.com/assets/images/artists/Gatsbys-Jukebox-Band-London/gatsbys-jukebox-main_1455206015.jpg", "http://www.helloasia.com.au/wp-content/uploads/2015/10/One-OK-Rock_1.jpg", "https://media.altpress.com/uploads/2018/06/Starset_-_Steve_Gullick_-Photo_2.jpg", "https://images.victoryrecords.com/600/astheyburn.jpg", "https://musicforlondon.co.uk/wp-content/uploads/2014/02/gipsy-duo-band-18-of-20.jpg", "http://www.dannybedrosian.com/images/smc26.jpg", "https://bocanewspaper.com/wp-content/uploads/2016/03/Pineapple-Newspaper-Turnstiles-2.jpg", "http://allenvenables.com/wp-content/uploads/2013/02/Airport-Impressions001.jpg","http://www.francerocks.dreamhosters.com/wp-content/uploads/2012/12/Gush1.jpg","http://www.syncmusic.jp/wordpress/wp-content/uploads/2012/08/YAMAARASHI.jpg","https://i.pinimg.com/originals/7a/80/83/7a80832fc8c5315e13ae3c2a46a21604.jpg","http://www.mountaintownmusic.org/media/bands/c3dc5a723d7c79ae68715cda158b86cb/16_9/2e0e3dd065f5e72cf4f3bc607bd55a51.jpeg","http://thesource.com/wp-content/uploads/2014/11/girls.jpg"]
24.times do
  instrument = Faker::Music.instrument
  band_name = Faker::RockBand.name
  location = AREAS.sample
  band = Band.new(
    name: band_name,
    genre: Faker::Music.genre,
    description: "#{band_name} is a multicultural band based in #{location}, Tokyo, Japan. Our sound combine influences such as Hard Rock, world music, and Latin, inspiring them to develop their own unique sound.
#{band_name} was created after the disbandment of their first group, Kill Your Idols, a Guns N’ Roses cover band, in the spring of 2017.
Since then they have performed as their current four piece lineup all over the Tokyo metropolitan area. \n \n '#{band_name}'は東京を拠点とし活動している多文化なバンド。
ハードロック、ワールドミュージック、ラテンなどを影響によりこれらのサウンドを融合し独自に進化したサウンドをもっている。
前身バンド'Kill Your Idols'キルユアアイドルズはガンズアンドローゼズのカバーバンドバンドとして2017年春にやっており、残った4人のメンバーでレッドベッドロックを結成する。\n \n WANTED!!! We need a #{instrument} player to join and help us build our future album, '#{Faker::Music.album }'.",
    instrument: instrument,
    address: location,
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
